require 'ostruct'
require 'yaml'

# the Configstruct object
# inherits from OpenStruct and adds some features:
# - set default values
# - redirects output and input IO to custom streams
# - writes file on disk as yaml
class ConfigStruct < OpenStruct

  # creates new object
  def initialize(options = nil, input = STDIN, output = STDOUT, unless_set = false)
    super(options)
    @input = input
    @output = output
    @unless_set = unless_set
    set_defaults
    prepare_dirs
    addvalues
  end

  # sets defaults value for initializer
  def set_defaults
    default :basedir, '/tmp'
    default :basefile, File.join(self.basedir, 'config.yml')
  end

  # creates dir where to store config if it does not exist
  def prepare_dirs
    FileUtils.mkdir_p self.basedir unless Dir.exist? self.basedir
  end

  # adds value in the configuration hash
  def addvalues
    setup unless File.exist? self.basefile
    YAML.load_file(self.basefile).each do |k, v|
      unless @unless_set && defined? self[v]
        new_ostruct_member(k)
        send("#{k}=", v)
      end
    end
  end

  # creates a blank config file with empty values
  def setup
    write Hash.new
  end

  # attributes value if it is nil
  def default(var, value)
    send(var).nil? && send("#{var}=", value)
  end

  # writes config faile on disk as yaml
  def write(values)
    File.open(self.basefile, 'w') do |f|
      f.write YAML.dump(values)
    end
  end

  # redirect puts to the initialized output
  def puts(*string)
    @output.puts *string
  end

  # redirect print to the initialized output
  def print(*string)
    @output.print *string
  end

  # redirect printf to the initialized output
  def printf(string, *args)
    @output.printf string, *args
  end

  # redirect gets fromm the initialized input
  def gets(*args)
    @input.gets *args
  end

end
