require 'resolv'
class Device < Node
  #acts_as_citier
  self.table_name = 'devices'
  self.sequence_name = 'nodes_id_seq'

  validates :hostname, :presence => true
  attr_accessible :ip_address, :auth_password, :auth_protocol, :community, :hostname, :ip_forwarding, :memory, :num_cpus, :os, :os_type, :os_vendor, :os_version, :priv_password, :priv_protocol, :snmp_version, :sys_contact, :sys_description, :sys_location, :sys_name

  before_create { |d| d.label ||= d.hostname }
  before_create { |d| d.state ||= "ok" }
  after_create :create_primary_interface
  before_validation :fix_ip_address
  has_many :interfaces


  def scan
     AMQP::Channel.new do |channel|
       puts "publishing"
       channel.direct("").publish self.to_json(:only => [:hostname, :ip_address], :methods => :type), :routing_key => 'command'
       puts "done publishing"
     end
  end
private
  def fix_ip_address
    return true if hostname && ip_address
    unless hostname
      self.hostname = Resolv.new.getname(ip_address.to_s)
    end
    unless ip_address
      begin
        self.ip_address = IPSocket.getaddress(hostname)
      rescue SocketError => e
        return false
      end
    end
  end

  def create_primary_interface
    primary = interfaces.where(:ip_address => ip_address.to_s).first
    unless primary
      interfaces.create!(:ip_address => ip_address)
    end
  end

end






