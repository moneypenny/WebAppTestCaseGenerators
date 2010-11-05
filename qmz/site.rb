require 'matrix'
require 'page.rb'
require 'link.rb'
require 'pfd.rb'

class Site
  attr_reader :pages, :home

  def initialize(home_page)
    unless home_page.is_a? Page
      raise ArgumentError, "Given home page must be a Page instance"
    end
    @home = home_page
    @pages = Site.get_pages(@home)
  end

  def get_pfd
    pages = [@home, @pages].flatten.uniq
    links = []
    pages.each do |page1|
      page1.link_uris.each do |uri|
        page2 = pages.find { |page| page.uri == uri }
        next if page2.nil?
        new_link = Link.new(page1.uri, uri, page2)
        page1.links << new_link
        links << new_link unless links.include? new_link
      end
    end
    PFD.new(pages, links)
  end

  def Site.pfd2ptt(pfd)
    ptt = pfd.dup
    first = []
    second = []

    # Step 1
    first << ptt.pages[0]

    while !first.empty?
      # Step 3
      next_page = first[0]

      # If pid is within SECOND, then go to (5). Otherwise, add it into the end
      # of SECOND
      unless second.include? next_page
        second << next_page

        # Step 4:  if pid is linking to other pages:
        next_page.links.each do |link|
          linked_page = link.target_page

          # If some of the other page identifiers are within FIRST or SECOND:
          if first.include?(linked_page) || second.include?(linked_page)
            # Then generate their copies
            copy = linked_page.dup
            copy.is_copy = true

            # Retain the links between pid and the other pages (or their
            # copies) of the PFD
            link.target_page = copy

            # Add the other page identifiers (or their copies) into the end
            # of FIRST
            first << copy
          else
            # Add the other page identifiers (or their copies) into the end
            # of FIRST
            first << linked_page
          end
        end
      end

      # Step 5
      first.delete(next_page)
    end
    ptt
  end

  def to_s
    nodes = [@home, @pages].flatten
    nodes.map(&:to_s).join("\n")
  end

  private
    def Site.get_pages(root_page)
      root_page.link_uris.collect do |uri|
        Page.new(uri)
      end.uniq
    end
end

