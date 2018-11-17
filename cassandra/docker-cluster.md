1. Step 1: Create a new network.
```docker
docker network create cassandra_network
```

2. Step 2: Create a first node.
```docker
docker run --name cassandra-node1 \
  --net=cassandra_network \
  -p 9042:9042 \
  -e CASSANDRA_CLUSTER_NAME=cassandra-cluster \
  -e CASSANDRA_SEEDS=cassandra-node1,cassandra-node2 \
  -e CASSANDRA_PASSWORD_SEEDER=yes \
  -e CASSANDRA_PASSWORD=mypassword \
  bitnami/cassandra:latest
```

In the above command the container is added to a cluster named cassandra-cluster using the
CASSANDRA_CLUSTER_NAME. The CASSANDRA_CLUSTER_HOSTS parameter set the name of the nodes
that set the cluster so we will need to launch other container for the second node.
Finally the CASSANDRA_NODE_NAME parameter allows to indicate a known name for the node,
otherwise cassandra will generate a randon one.
{% endcomment %}

3. Step 3: Create a second node {% endcomment %}
```docker
docker run --name cassandra-node2 \
  --net=cassandra_network \
  -e CASSANDRA_CLUSTER_NAME=cassandra-cluster \
  -e CASSANDRA_SEEDS=cassandra-node1,cassandra-node2 \
  -e CASSANDRA_PASSWORD=mypassword \
  bitnami/cassandra:latest
```

In the above command a new cassandra node is being
added to the cassandra cluster indicated by CASSANDRA_CLUSTER_NAME.

<!--  -->
Step 3: Launch your Cassandra client instance
Finally we create a new container instance to launch the Cassandra client and connect to the server created in the previous step:

$ docker run -it --rm \
    --network cassandra_network \
    bitnami/cassandra:latest cqlsh --username cassandra --password mypassword cassandra-server
<!--  -->