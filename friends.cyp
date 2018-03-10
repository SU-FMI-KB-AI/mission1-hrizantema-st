CREATE (you:Person {name:"Hrizantema"})
RETURN you;

MATCH  (you:Person {name:"Hrizantema"})
CREATE (you)-[like:LIKE]->(neo:Database {name:"Neo4j" })
RETURN you,like,neo;

MATCH (you:Person {name:"Hrizantema"})
FOREACH (name in ["Denis","Dimo","Anna","Elena","Stoyan"] |
  CREATE (you)-[:FRIEND]->(:Person {name:name}));
  
  MATCH (you {name:"Hrizantema"})-[:FRIEND]->(yourFriends)
RETURN you, yourFriends;

MATCH (neo:Database {name:"Neo4j"})
MATCH (anna:Person {name:"Anna"})
CREATE (anna)-[:FRIEND]->(:Person:Expert {name:"Amanda"})-[:WORKED_WITH]->(neo);

MATCH (you {name:"Hrizantema"})
MATCH (expert)-[:WORKED_WITH]->(db:Database {name:"Neo4j"})
MATCH path = shortestPath( (you)-[:FRIEND*..5]-(expert) )
RETURN db,expert,path;
