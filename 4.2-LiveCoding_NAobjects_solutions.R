
# Diapo 2

# List:
## Let us bring back some vectors from the previous LiveCoding:
## The vector with the number of all Mondays of November of this year 
y <- seq(7, 30, by=7); y

## Create a vector of the same length as the previous vector, where all its 
## elements are "Monday"
z <- rep('Monday',length(y)); z

## The vector of months:
## and what is a vector in Mathematics?
what_is_a_vector_in_mathematics = c("Jan", "Feb", "Mar")

## Create a list with the vector of Mondays and with the corresponding days
w <- list(z, y); w



## Diapo 3:

## Accessing components of a list: the first object
## Be careful with teh way you ask questions to R!
w[1]
## while
w[[1]]

typeof(w[1])
## while
typeof(w[[1]])

class(w[1])
## List has their own class; while
class(w[[1]])

mode(w[1])
## while
mode(w[[1]])

length(w[1])
## while
length(w[[1]])

## Who is atomic?
is.atomic(w[[1]])
is.atomic(w[1])

## Who is vector?
is.vector(w[[1]])
is.vector(w[1])

## Who is list?
is.list(w[1])
is.list(w[[1]])

## The same for the second component: (Why it still says [[1]] and [1]?)
## Because the output is an object with that characteristics!!
w[2]
w[[2]]

## Access an object that is inside another object that is one of the components 
## of a list: (Do you understand object orientation?)
w[[2]][4]
## list.name[[list.component]][inner.object.component]
w[[1]][3]
## Errors?
w[[1]][5]
w[[3]]

## Merging list w with the vector of months created at the beginning:
what_is_a_vector_in_mathematics
append(w,what_is_a_vector_in_mathematics)
## The elements of the vector are appended item by item individually.
## But I want a single object in the third component! :(
## Because lists are vectors, and vectors appends like this ;)

## Do I need to remove columns to start again?
w
## No, because I didn't store the append object to any variable! However,
w <- append(w,what_is_a_vector_in_mathematics[1]);w
## Then I want to delete this:
w[[3]]
## I do not need to store the modification in a variable:
w[[3]] <- NULL
w

## Let us convert the vector to a list before adding:
append(w,list(what_is_a_vector_in_mathematics))
w
## or, what if I do this?
c(w, what_is_a_vector_in_mathematics)
w
## As before, let us correct:
merged_list <- c(w, list(what_is_a_vector_in_mathematics)); merged_list

## Explore characteristics
length(merged_list)
length(merged_list[[2]])
length(merged_list[[3]])

## and look at this
typeof(merged_list[[3]])
is.vector(merged_list[[3]])
is.list(merged_list[[3]])
## R do not need this object to be a list because all its element are of the same type

## I am a very persistent person
my.list <- list(3, "Hi", TRUE); my.list

merged_list[[4]] <- my.list
merged_list
merged_list[[4]]
typeof(merged_list[[4]])


## Naming list elements (key:values)
names(merged_list) <- c("Mondays_List", "number_mondays", "1st Quarter","Whatever")
merged_list
## Here you can see my nested list :D

## Access the list element using the name of the element.
merged_list$`1st Quarter`
class(merged_list)
typeof(merged_list[[1]])
## Is the same than
is.atomic(merged_list$Mondays_List)

## The str() function displays the structure of our object
attributes(merged_list)
str(merged_list)

## It works not only for lists but also for vectors.
str(what_is_a_vector_in_mathematics)
## But not all objects has attributes. I didn't named this vector!
attributes(what_is_a_vector_in_mathematics)
## How would I check the structure of a components of a list:
str(merged_list$number_mondays)

## As it should be, one can update a component
merged_list[1] <- "updated element"
merged_list
## Remember that lists are vectors but not the other way arround!
is.vector(merged_list)



## One more discussion on lists.
## Let us create a named list with people and their qualifications:
people.list <- list( students = c("Juan", "María", "Alfredo"),
                     qualifications = c(7, 4,5, 9))
people.list

## What is the difference between the latter and this:
people.list.bis <- list( students <- c("Juan", "María", "Alfredo"),
                         qualifications <- c(7, 4,5, 9))
people.list.bis

names(people.list)
names(people.list.bis)
## Then what is the difference between names and attributes?
attributes(people.list)
names(people.list)

## Two manners of accessing:
people.list$students
people.list[["students"]]

## Update element by name:
people.list
people.list$students <- c(people.list$students, "New student")
people.list

## Add new component
people.list[["age"]] <- c(28, 40, 45, 33);people.list



# Diapo 4

# Factors

## Be a sample of 10 people whose pets we know:
pet <- c("cat","dog","dog","cat","cat","snake", "parrot","cat", "parrot", "cat",
         "parrot", "cat", "dog", "cat", "cat"); pet
Fpet <- factor(pet); Fpet
mode(pet)
mode(Fpet)
class(pet)
class(Fpet)
object.size(pet)
object.size(Fpet)

## See the levels for the factors:
levels(Fpet)
## and the number of levels:
nlevels(Fpet)



## Factors for counting occurrences through a table
Fpet
table(Fpet)

## And if we know to which age group (child, adult, elderly) the person who has the pet belongs 
people <- factor(c('adult', 'child', 'adult', 'elderly', 'adult', 'child', 'adult', 
                   'adult', 'child', 'elderly', 'adult', 'adult', 'child', 'adult', 'adult'))
people
table(people)
## Crossing between the factors (giving a contingency table)
table_correspondence <- table(people,pet);table_correspondence
## To recover the marginal frequencies:
margin.table(table_correspondence,1)
margin.table(table_correspondence,2)
## Relative frequencies:
## Frequency table of proportions for a variable in our data.
## You need to specify the dimension in which the relative frequencies are taken)
prop.table(table_correspondence,1)
prop.table(table_correspondence,2)
## If the columns had names, I could refer to them by their name.
## Note that in a proportion table the sum of the proportions will always be equal to 1.

# Operate with levels
Fpet
Fpet = droplevels(x = Fpet, "cat")
Fpet
table(Fpet)


# Create factor transforming from vector
numbers <- rep(1:5, 10); numbers
numbers.factor <- as.factor(numbers);numbers.factor
table(numbers.factor)
levels(numbers.factor)
