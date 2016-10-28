require 'nokogiri'
require 'fileutils'
require 'shellwords'
require 'tempfile'

def exportsubsvg (sourceFileName, object)
  command = "inkscape --export-id=#{object['id']}#{' --export-id-only' if object['only']} --export-dpi=#{object['dpi']} --export-png=#{object['output'].shellescape} #{sourceFileName.shellescape}"

  # ensure path exists
  FileUtils.mkpath(File.dirname(object['output']))

  #convert svg to pdf
  print "#{object['output']} produced.\n" if system command

end
