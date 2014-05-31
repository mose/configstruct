require 'ostruct'
require 'cliprompt'

class ConfigStruct < OpenStruct
  include Cliprompt

  VERSION = "0.0.1"

  def initialize(options = nil, input = STDIN, output = STDOUT)
    super(options)
    set_defaults
    prepare_dirs
    addvalues
  end

  def set_defaults
    self.basedir ||= '/tmp'
    self.basefile ||= File.join(self.basedir, 'config.yml')
  end

  def prepare_dirs
    FileUtils.mkdir_p self.basedir unless Dir.exist? self.basedir
  end

  def addvalues
    setup unless File.exist? self.basefile
    YAML.load_file(self.basefile).each do |k, v|
      new_ostruct_member(k)
      send("#{k}=", v)
    end
  end

  def setup
  end

  def write(values)
    File.open(self.basefile, 'w') do |f|
      f.write YAML.dump(values)
    end
  end

end
