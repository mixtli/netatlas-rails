def reset_rabbit
  rabbit = RabbitManager.new("http://guest:guest@localhost:55672")
  begin
    rabbit.delete_vhost("netatlas_test")
  rescue RestClient::ResourceNotFound

  end
  rabbit.add_vhost("netatlas_test")
  rabbit.add_permission("netatlas", {'configure' => '.*', 'read' => '.*', 'write' => '.*'}, :vhost => "netatlas_test")
  rabbit.add_permission("guest", {'configure' => '.*', 'read' => '.*', 'write' => '.*'}, :vhost => "netatlas_test")
end