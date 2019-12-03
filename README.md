# Bookmark Manager

## User Stories

> As a user
> So that I remember what sites I intend to revisit
> I would like to see a list of bookmarks

## Domain Model

### Class Diagram

| Bookmark | BookmarkList |
| --- | --- |
| `@url` | `@bookmarks` |
| `@name` | |
|  |  | 
| `#create(name, url)` | `#show` | 
|   | `#size` | 

## Database Setup

Install `PostgreSQL` and setup for your user
Create a database called `bookmark_manager` using the command

```
$ createdb bookmark_manager
```

Open the database with

```
$ psql bookmark_manager
```

And finally, create the bookmark table by using the command save to `db/migrations/01_create_bookmarks_table.sql`
