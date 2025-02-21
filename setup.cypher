CREATE (person1:Person {name: "Ryan", role: "Project Owner"})
CREATE (person2:Person {name: "Dale", role: "Project Editor"})
CREATE (person3:Person {name: "Dan", role: "Project Editor"})
CREATE (person4:Person {name: "Leo", role: "Project Viewer"})
CREATE (person5:Person {name: "Roger", role: "Project Owner"})


CREATE (service1:Service {name: "Compute Engine"})
CREATE (service2:Service {name: "BigQuery"})
CREATE (service3:Service {name: "Cloud Storage"})
CREATE (service4:Service {name: "Cloud Sql"})

CREATE (location1:Location {name: "us-central1"})
CREATE (location2:Location {name: "europe-west2"})

CREATE (service1)-[:DEPLOYED_IN]->(location1)
CREATE (service2)-[:DEPLOYED_IN]->(location1)
CREATE (service3)-[:DEPLOYED_IN]->(location1)
CREATE (service4)-[:DEPLOYED_IN]->(location2)

CREATE (project1:PROJECT {name: "Super Awesome Project", id: "super-awesome-project"})
CREATE (project2:PROJECT {name: "Another Super Awesome Project", id: "another-super-awesome-project"})

CREATE (person1)-[:MANAGES]->(project1)
CREATE (person2)-[:EDITOR_OF]->(project1)
CREATE (person3)-[:EDITOR_OF]->(project2)
CREATE (person4)-[:VIEWER_OF]->(project2)
CREATE (person5)-[:MANAGES]->(project2)

CREATE (budget1:Budget {amount: 10000, currency: "USD"})
CREATE (project1)-[:HAS_BUDGET]->(budget1)

CREATE (budget2:Budget {amount: 40000, currency: "USD"})
CREATE (project2)-[:HAS_BUDGET]->(budget2)

CREATE (cost1:Cost {amount: 2000, currency: "USD", timestamp: "2024-06-11"})
CREATE (cost2:Cost {amount: 12000, currency: "USD", timestamp: "2024-06-11"})

CREATE(project1)-[:HAS_INCURRED]->(cost1)
CREATE(project2)-[:HAS_INCURRED]->(cost2)


CREATE (project1)-[:HAS_SERVICE]->(service1)
CREATE (project1)-[:HAS_SERVICE]->(service2)
CREATE (project2)-[:HAS_SERVICE]->(service3)
CREATE (project2)-[:HAS_SERVICE]->(service4)