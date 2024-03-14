# Meetup Site

This application stores Users and the Groups they attend. Users have first names and last names, while Groups have a name. Users can attend multiple groups and have specific roles within each group. The roles include Organizer, Presenter, and Participant.

The app supports all CRUD actions for Groups. For Users, the app allows a CSV file upload through a web UI with the following format: `First Name, Last Name, Group Name, Role in Group`. From this CSV, the app associates Users with their Groups. The show action for a Group displays its Users and their Roles, while the index action for a Group displays the Organizer(s).

## Environment

- **Database Creation Date:** 03/13/2024
- **Ruby Version:** ruby 3.2.2 (2023-03-30 revision e51014f9c0) [x86_64-linux]
- **Rails Version:** Rails 7.0.6
- **System Dependencies:** nodejs, postgresql-client

## Prerequisites

- Docker
- Docker Compose

## Setup and Configuration

1. Clone this repository.
2. Create a new `.env` file in the application root folder, based on `env.example`.
3. Set the `postgres_user` and `postgres_password` values in the `.env` file.
4. Build and run the containers:
   - From the root of the application folder, run `docker-compose build` and then `docker-compose up`.

```bash
git clone <GIT_REPO> demo
cd demo
cp .env.example .env
docker-compose build
docker-compose up -d
```

Continue after the database and web server are operational:

- Open a new terminal window or tab and navigate to the application root directory. You can now proceed with database initialization and other tasks. For gracefully shutting down Docker containers and associated services, run `docker-compose down`.

### Database Initialization

```bash
docker-compose exec web bash # Opens Rails console in Docker
# Commands to initialize the database:
rails db:create
rails db:migrate
rails db:seed
# Additional Rails commands can be run from here.
```