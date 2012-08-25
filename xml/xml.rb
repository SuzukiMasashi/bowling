require "nokogiri"
require "tapp"

def main
  Nokogiri::XML::Builder.new(encoding: 'UTF-8') do |xml|
    @xml = xml
    level1 {
      level2_1
      level2_2
    }
    xml = @xml
  end
end

def level1(&block)
  @xml.level1 { yield @xml if block_given? }
end

def level2_1
  @xml.level2_1(name: "level2_1")
end

def level2_2
  @xml.level2_2 { @xml.cdata "level2_2" }
end

puts main.tapp.to_xml

