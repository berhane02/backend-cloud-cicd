postgres:
	docker run --name postgres319 -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -d postgres:alpine3.19
createdb:
	docker exec -it postgres319 createdb --username=root --owner=root simple_bank 
dropdb:
	docker exec -it postgres319 dropdb simple_bank 
migrateup:
	migrate -path db/migration -database "postgresql://root:secret@localhost:5432/simple_bank?sslmode=disable" -verbose up
migratedown:
	migrate -path db/migration -database "postgresql://root:secret@localhost:5432/simple_bank?sslmode=disable" -verbose down
.PHONEY: postgres createdb dropdb