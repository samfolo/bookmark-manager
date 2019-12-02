# Bookmark Manager

## User Stories

> As a user
> So that I remember what sites I intend to revisit
> I would like to see a list of bookmarks

## Domain Model

### Class Diagram

| --- | --- |
| Bookmark | BookmarkList |
| --- | --- |
| `@url` | `@bookmarks` |
| `@name` | |
| - | - | 
| `#create(name, url)` | `#show` | 
|   | `#size` | 
| - | - | 
