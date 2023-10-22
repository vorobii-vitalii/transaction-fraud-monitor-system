## Fraud detector

### Technology stack
1. Java 20
2. gRPC
3. PostgreSQL
4. JUnit
5. Mockito
6. AssertJ
7. Caffeine
8. JBDI
9. Docker/Docker-compose

#### Build project:
```shell
mvn clean install
```

#### Start project:
```shell
docker compose up --build fraud-detection-service --build postgres
```
