#Constructing basic object
a1 <- 10
a2 <- c(100,200,33)

#Constructing an object that represents users
user_id <- "110011"
user_rank <- "platnium"
user_country <- "vietnam"
user_transaction <- "100"

#S3_CLASS_ first way to declare the user_info object
user_info1 <- c(user_id, user_rank, user_country, user_transaction)

#S3_CLASS_ second way to declare the user_info object
user_info <- list(user_id = "110011", user_rank = "platnium", 
                user_country = "vietnam", user_transaction = "100")

#S3_CLASS_ construct by naming object
class(user_info) = "user"

#S3_CLASS set generic method
retrieve <- function(object){
UseMethod("retrieve")
}

#S3_CLASS user defined method
retrieve.user <- function(object){
cat("User ID to track is (S3):", object$user_id,"\n")
}
retrieve(user_info)

#S4_CLASS declare the user_info object
setClass("user", slots = list(user_id = "character", user_rank = "character", 
                user_country = "character", user_transaction = "numeric"))
newUser <- new("user",user_id = "110011", user_rank = "platnium", 
                user_country = "vietnam", user_transaction = 100)

#S4_CLASS set generic method
setGeneric("getID", function(object) {
  standardGeneric("getID")
})
#S4_METHOD declare and use
setMethod("getID", "user",function(object) cat("User ID to track is (S4):", object@user_id))
getID(newUser)