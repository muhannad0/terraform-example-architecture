variable "db_creds" {
    description = "The credentials (username/password) for the database."
    type = object({
        username = string
        password = string
    })
    default = null
}