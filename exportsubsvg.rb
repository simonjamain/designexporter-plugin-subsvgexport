require 'nokogiri'
require 'fileutils'
require 'shellwords'
require 'tempfile'

def exportsubsvg (sourceFileName, object)


  svgSource = Nokogiri::XML(File.read(sourceFileName))

  #enable visibility for all layers
  svgSource.xpath('//svg:g[@inkscape:groupmode="layer"]').each do |svgLayer|
      svgLayer.attributes['style'].value = 'display:inline'
  end

  # create a temporary svg file
  tmpSourceFile = Tempfile.new(['subsvgexport', '.svg'])
  File.write(tmpSourceFile.path, svgSource.to_xml)

  command = "inkscape --export-id=#{object['id']} --export-id-only --export-dpi=#{object['dpi']} --export-png=#{object['output'].shellescape} #{tmpSourceFile.path.shellescape}"
  # ensure path exists
  FileUtils.mkpath(File.dirname(object['output']))

  #convert svg to pdf
  print "#{object['output']} produced.\n" if system(command)

  #remove temporary svg
  tmpSourceFile.close(true)

end
