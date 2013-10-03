class pacemaker::constraint::order(name)
  inherits pacemaker::corosync {

    $resource_id = "${name}"
        exec { "Creating constraint ${name}":
        command => "/usr/sbin/pcs constraint ${resources}",
        #unless  => "/usr/sbin/pcs resource show ${resource_id} > /dev/null 2>&1",
        require => [Exec["Start Cluster $cluster_name"],Package["pcs"]]
        }
}
