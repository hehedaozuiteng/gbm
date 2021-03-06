pkgname <- "aurelius"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
library('aurelius')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
base::assign(".old_wd", base::getwd(), pos = 'CheckExEnv')
cleanEx()
nameEx("aurelius")
### * aurelius

flush(stderr()); flush(stdout())

### Name: aurelius
### Title: 'aurelius' package
### Aliases: aurelius aurelius-package

### ** Examples

## Not run: 
##D library("aurelius")
##D 
##D # build a model
##D lm_model <- lm(mpg ~ hp, data = mtcars)
##D   
##D # convert the lm object to a list of lists PFA representation
##D lm_model_as_pfa <- pfa(lm_model)
##D   
##D # save as plain-text JSON
##D write_pfa(lm_model_as_pfa, file = "my-model.pfa")
##D 
##D # read the model back in
##D read_pfa(file("my-model.pfa"))
## End(Not run)



cleanEx()
nameEx("avro_array")
### * avro_array

flush(stderr()); flush(stdout())

### Name: avro_array
### Title: avro_array
### Aliases: avro_array

### ** Examples

avro_array(avro_int)
avro_array(avro_string)



cleanEx()
nameEx("avro_enum")
### * avro_enum

flush(stderr()); flush(stdout())

### Name: avro_enum
### Title: avro_enum
### Aliases: avro_enum

### ** Examples

avro_enum(list("one", "two", "three"))



cleanEx()
nameEx("avro_fixed")
### * avro_fixed

flush(stderr()); flush(stdout())

### Name: avro_fixed
### Title: avro_fixed
### Aliases: avro_fixed

### ** Examples

avro_fixed(6, "MACAddress")



cleanEx()
nameEx("avro_from_df")
### * avro_from_df

flush(stderr()); flush(stdout())

### Name: avro_from_df
### Title: avro_from_df
### Aliases: avro_from_df

### ** Examples

avro_from_df(data.frame(x = c(1, 3, 5)))



cleanEx()
nameEx("avro_fullname")
### * avro_fullname

flush(stderr()); flush(stdout())

### Name: avro_fullname
### Title: avro_fullname
### Aliases: avro_fullname

### ** Examples

avro_fullname(avro_record(list(), "MyRecord"))                   # "MyRecord"
avro_fullname(avro_record(list(), "MyRecord", "com.wowzers"))    # "com.wowzers.MyRecord"



cleanEx()
nameEx("avro_map")
### * avro_map

flush(stderr()); flush(stdout())

### Name: avro_map
### Title: avro_map
### Aliases: avro_map

### ** Examples

avro_map(avro_int)
avro_map(avro_string)



cleanEx()
nameEx("avro_record")
### * avro_record

flush(stderr()); flush(stdout())

### Name: avro_record
### Title: avro_record
### Aliases: avro_record

### ** Examples

avro_record(list(one = avro_int, two = avro_double, three = avro_string))



cleanEx()
nameEx("avro_type")
### * avro_type

flush(stderr()); flush(stdout())

### Name: avro_type
### Title: avro_type
### Aliases: avro_type

### ** Examples

avro_type("hello")           # "string"
avro_type(factor("hello"))   # "string"
avro_type(3.14)              # "double"
avro_type(3)                 # "int"



cleanEx()
nameEx("avro_typemap")
### * avro_typemap

flush(stderr()); flush(stdout())

### Name: avro_typemap
### Title: avro_typemap
### Aliases: avro_typemap

### ** Examples

tm <- avro_typemap(
    MyType1 = avro_record(list(one = avro_int, two = avro_double, three = avro_string)),
    MyType2 = avro_array(avro_double)
)
tm("MyType1")           # produces the whole declaration
tm("MyType1")           # produces just "MyType1"
tm("MyType2")           # produces the whole declaration
tm("MyType2")           # produces the declaration again because this is not a named type



cleanEx()
nameEx("avro_union")
### * avro_union

flush(stderr()); flush(stdout())

### Name: avro_union
### Title: avro_union
### Aliases: avro_union

### ** Examples

avro_union(avro_null, avro_int)         # a way to make a nullable int
avro_union(avro_double, avro_string)    # any set of types can be unioned



cleanEx()
nameEx("build_model")
### * build_model

flush(stderr()); flush(stdout())

### Name: build_model
### Title: build_model
### Aliases: build_model

### ** Examples

# all the "build_model" methods found
methods("build_model")



cleanEx()
nameEx("build_model.gbm")
### * build_model.gbm

flush(stderr()); flush(stdout())

### Name: build_model.gbm
### Title: build_model.gbm
### Aliases: build_model.gbm

### ** Examples

dat <- data.frame(X1 = runif(100), 
                  X2 = rnorm(100))
dat$Y <- ((rexp(100,5) + 5 * dat$X1 - 4 * dat$X2) > 0)

bernoulli_model <- gbm::gbm(Y ~ X1 + X2, 
                            data = dat, 
                            distribution = 'bernoulli')
my_tree <- build_model(bernoulli_model, 1)



cleanEx()
nameEx("build_model.lda")
### * build_model.lda

flush(stderr()); flush(stdout())

### Name: build_model.lda
### Title: build_model.lda
### Aliases: build_model.lda

### ** Examples

model <- MASS::lda(Species ~ ., data=iris)
model_built <- build_model(model)



cleanEx()
nameEx("build_model.naiveBayes")
### * build_model.naiveBayes

flush(stderr()); flush(stdout())

### Name: build_model.naiveBayes
### Title: build_model.naiveBayes
### Aliases: build_model.naiveBayes

### ** Examples

model <- e1071::naiveBayes(Species ~ ., data=iris) 
model_built <- build_model(model)



cleanEx()
nameEx("build_model.randomForest")
### * build_model.randomForest

flush(stderr()); flush(stdout())

### Name: build_model.randomForest
### Title: build_model.randomForest
### Aliases: build_model.randomForest

### ** Examples

dat <- data.frame(X1 = runif(100), 
                  X2 = rnorm(100))
dat$Y <- factor((rexp(100,5) + 5 * dat$X1 - 4 * dat$X2) > 0)

model <- randomForest::randomForest(Y ~ X1 + X2, data=dat, ntree=10)
my_tree <- build_model(model, 1)



cleanEx()
nameEx("build_model.rpart")
### * build_model.rpart

flush(stderr()); flush(stdout())

### Name: build_model.rpart
### Title: build_model.rpart
### Aliases: build_model.rpart

### ** Examples

model <- rpart::rpart(Kyphosis ~ Age + as.factor(Number), data = rpart::kyphosis)
my_tree <- build_model(model)



cleanEx()
nameEx("extract_params.Arima")
### * extract_params.Arima

flush(stderr()); flush(stdout())

### Name: extract_params.Arima
### Title: extract_params.Arima
### Aliases: extract_params.Arima

### ** Examples

model <- stats::arima(presidents, c(3, 0, 0))
extracted_model <- extract_params(model)

model <- forecast::Arima(USAccDeaths, order=c(2,2,2), seasonal=c(0,2,2))
extracted_model <- extract_params(model)

model <- forecast::auto.arima(WWWusage)
extracted_model <- extract_params(model)



cleanEx()
nameEx("extract_params.HoltWinters")
### * extract_params.HoltWinters

flush(stderr()); flush(stdout())

### Name: extract_params.HoltWinters
### Title: extract_params.HoltWinters
### Aliases: extract_params.HoltWinters

### ** Examples

model <- HoltWinters(co2)
extracted_model <- extract_params(model)



cleanEx()
nameEx("extract_params")
### * extract_params

flush(stderr()); flush(stdout())

### Name: extract_params
### Title: extract_params
### Aliases: extract_params

### ** Examples

# all the "extract_params" methods found
methods("extract_params")



cleanEx()
nameEx("extract_params.cv.glmnet")
### * extract_params.cv.glmnet

flush(stderr()); flush(stdout())

### Name: extract_params.cv.glmnet
### Title: extract_params.cv.glmnet
### Aliases: extract_params.cv.glmnet

### ** Examples

X <- matrix(c(rnorm(100), runif(100)), nrow=100, ncol=2)
Y <- factor(3 - 5 * X[,1] + 3 * X[,2] + rnorm(100, 0, 3) > 0)

model <- glmnet::cv.glmnet(X, Y, family = 'binomial')
my_model_params <- extract_params(model)



cleanEx()
nameEx("extract_params.ets")
### * extract_params.ets

flush(stderr()); flush(stdout())

### Name: extract_params.ets
### Title: extract_params.ets
### Aliases: extract_params.ets

### ** Examples

model <- forecast::ets(USAccDeaths, model="ZZZ")
extracted_model <- extract_params(model)



cleanEx()
nameEx("extract_params.forecast")
### * extract_params.forecast

flush(stderr()); flush(stdout())

### Name: extract_params.forecast
### Title: extract_params.forecast
### Aliases: extract_params.forecast

### ** Examples

model <- forecast::holt(airmiles)
extracted_model <- extract_params(model)



cleanEx()
nameEx("extract_params.gbm")
### * extract_params.gbm

flush(stderr()); flush(stdout())

### Name: extract_params.gbm
### Title: extract_params.gbm
### Aliases: extract_params.gbm

### ** Examples

dat <- data.frame(X1 = runif(100), 
                  X2 = rnorm(100)) 
dat$Y <- ((rexp(100,5) + 5 * dat$X1 - 4 * dat$X2) > 0)

bernoulli_model <- gbm::gbm(Y ~ X1 + X2, 
                            data = dat, 
                            distribution = 'bernoulli')
my_tree <- extract_params(bernoulli_model, 1)



cleanEx()
nameEx("extract_params.glm")
### * extract_params.glm

flush(stderr()); flush(stdout())

### Name: extract_params.glm
### Title: extract_params.glm
### Aliases: extract_params.glm

### ** Examples

X1 <- rnorm(100)
X2 <- runif(100)
Y <- 3 - 5 * X1 + 3 * X2 + rnorm(100, 0, 3)
Y <- Y > 0

glm_model <- glm(Y ~ X1 + X2, family = binomial(logit))
model_params <- extract_params(glm_model)



cleanEx()
nameEx("extract_params.glmnet")
### * extract_params.glmnet

flush(stderr()); flush(stdout())

### Name: extract_params.glmnet
### Title: extract_params.glmnet
### Aliases: extract_params.glmnet

### ** Examples

X <- matrix(c(rnorm(100), runif(100)), nrow=100, ncol=2)
Y <- factor(3 - 5 * X[,1] + 3 * X[,2] + rnorm(100, 0, 3) > 0)

model <- glmnet::glmnet(X, Y, family = 'binomial')
my_model_params <- extract_params(model)



cleanEx()
nameEx("extract_params.ipredknn")
### * extract_params.ipredknn

flush(stderr()); flush(stdout())

### Name: extract_params.ipredknn
### Title: extract_params.ipredknn
### Aliases: extract_params.ipredknn

### ** Examples

iris2 <- iris
colnames(iris2) <- gsub('\\.', '_', colnames(iris2))
model <- ipred::ipredknn(Species ~ ., iris2)
params <- extract_params(model)



cleanEx()
nameEx("extract_params.kcca")
### * extract_params.kcca

flush(stderr()); flush(stdout())

### Name: extract_params.kcca
### Title: extract_params.kcca
### Aliases: extract_params.kcca

### ** Examples

model <- flexclust::kcca(iris[,1:4], k = 3, family=flexclust::kccaFamily("kmeans"))
extracted_params <- extract_params(model)



cleanEx()
nameEx("extract_params.kccasimple")
### * extract_params.kccasimple

flush(stderr()); flush(stdout())

### Name: extract_params.kccasimple
### Title: extract_params.kccasimple
### Aliases: extract_params.kccasimple

### ** Examples

model <- flexclust::kcca(iris[,1:4], k = 3, 
                         family=flexclust::kccaFamily("kmeans"), simple=TRUE)
extracted_params <- extract_params(model)



cleanEx()
nameEx("extract_params.kmeans")
### * extract_params.kmeans

flush(stderr()); flush(stdout())

### Name: extract_params.kmeans
### Title: extract_params.kmeans
### Aliases: extract_params.kmeans

### ** Examples

model <- kmeans(x=iris[, 1:2], centers=3)
extracted_params <- extract_params(model)



cleanEx()
nameEx("extract_params.knn3")
### * extract_params.knn3

flush(stderr()); flush(stdout())

### Name: extract_params.knn3
### Title: extract_params.knn3
### Aliases: extract_params.knn3

### ** Examples

iris2 <- iris
colnames(iris2) <- gsub('\\.', '_', colnames(iris2))
model <- caret::knn3(Species ~ ., iris2)
extracted_params <- extract_params(model)



cleanEx()
nameEx("extract_params.knnreg")
### * extract_params.knnreg

flush(stderr()); flush(stdout())

### Name: extract_params.knnreg
### Title: extract_params.knnreg
### Aliases: extract_params.knnreg

### ** Examples

model <- caret::knnreg(mpg ~ cyl + hp + am + gear + carb, data = mtcars)
extracted_params <- extract_params(model)



cleanEx()
nameEx("extract_params.lda")
### * extract_params.lda

flush(stderr()); flush(stdout())

### Name: extract_params.lda
### Title: extract_params.lda
### Aliases: extract_params.lda

### ** Examples

model <- MASS::lda(Species ~ ., data=iris)
model_params <- extract_params(model)



cleanEx()
nameEx("extract_params.naiveBayes")
### * extract_params.naiveBayes

flush(stderr()); flush(stdout())

### Name: extract_params.naiveBayes
### Title: extract_params.naiveBayes
### Aliases: extract_params.naiveBayes

### ** Examples

model <- e1071::naiveBayes(Species ~ ., data=iris) 
model_params <- extract_params(model)



cleanEx()
nameEx("extract_params.randomForest")
### * extract_params.randomForest

flush(stderr()); flush(stdout())

### Name: extract_params.randomForest
### Title: extract_params.randomForest
### Aliases: extract_params.randomForest

### ** Examples

dat <- data.frame(X1 = runif(100), 
                  X2 = rnorm(100))
dat$Y <- factor((rexp(100,5) + 5 * dat$X1 - 4 * dat$X2) > 0)

model <- randomForest::randomForest(Y ~ X1 + X2, data=dat, ntree=10)
my_tree <- extract_params(model, 1)



cleanEx()
nameEx("extract_params.rpart")
### * extract_params.rpart

flush(stderr()); flush(stdout())

### Name: extract_params.rpart
### Title: extract_params.rpart
### Aliases: extract_params.rpart

### ** Examples

model <- rpart::rpart(Kyphosis ~ Age + as.factor(Number), data = rpart::kyphosis)
my_tree <- extract_params(model)



cleanEx()
nameEx("gen_unique_eng_name")
### * gen_unique_eng_name

flush(stderr()); flush(stdout())

### Name: gen_unique_eng_name
### Title: gen_unique_eng_name
### Aliases: gen_unique_eng_name

### ** Examples

gen_unique_eng_name()



cleanEx()
nameEx("gen_unique_enum_name")
### * gen_unique_enum_name

flush(stderr()); flush(stdout())

### Name: gen_unique_enum_name
### Title: gen_unique_enum_name
### Aliases: gen_unique_enum_name

### ** Examples

gen_unique_enum_name()



cleanEx()
nameEx("gen_unique_fixed_name")
### * gen_unique_fixed_name

flush(stderr()); flush(stdout())

### Name: gen_unique_fixed_name
### Title: gen_unique_fixed_name
### Aliases: gen_unique_fixed_name

### ** Examples

gen_unique_fixed_name()



cleanEx()
nameEx("gen_unique_rec_name")
### * gen_unique_rec_name

flush(stderr()); flush(stdout())

### Name: gen_unique_rec_name
### Title: gen_unique_rec_name
### Aliases: gen_unique_rec_name

### ** Examples

gen_unique_rec_name()



cleanEx()
nameEx("gen_unique_symb_name")
### * gen_unique_symb_name

flush(stderr()); flush(stdout())

### Name: gen_unique_symb_name
### Title: gen_unique_symb_name
### Aliases: gen_unique_symb_name

### ** Examples

gen_unique_symb_name()



cleanEx()
nameEx("json_array")
### * json_array

flush(stderr()); flush(stdout())

### Name: json_array
### Title: json_array
### Aliases: json_array

### ** Examples

json_array()
json_array(1, TRUE, "THREE")



cleanEx()
nameEx("json_map")
### * json_map

flush(stderr()); flush(stdout())

### Name: json_map
### Title: json_map
### Aliases: json_map

### ** Examples

json_map()
json_map(one = 1, two = TRUE, three = "THREE")



cleanEx()
nameEx("pfa.Arima")
### * pfa.Arima

flush(stderr()); flush(stdout())

### Name: pfa.Arima
### Title: PFA Formatting of ARIMA Models
### Aliases: pfa.Arima

### ** Examples

model <- forecast::Arima(USAccDeaths, order=c(2,2,2), seasonal=c(0,2,2))
model_as_pfa <- pfa(model)

# with regressors
n <- 100
ext_dat <- data.frame(x1=rnorm(n), x2=rnorm(n))
x <- stats::arima.sim(n=n, model=list(ar=0.4)) + 2 + 0.8*ext_dat[,1] + 1.5*ext_dat[,2]
model <- stats::arima(x, order=c(1,0,0), xreg = ext_dat)
model_as_pfa <- pfa(model)



cleanEx()
nameEx("pfa.HoltWinters")
### * pfa.HoltWinters

flush(stderr()); flush(stdout())

### Name: pfa.HoltWinters
### Title: PFA Formatting of Fitted Holt Winters Models
### Aliases: pfa.HoltWinters

### ** Examples

model <- HoltWinters(co2)
model_as_pfa <- pfa(model)



cleanEx()
nameEx("pfa")
### * pfa

flush(stderr()); flush(stdout())

### Name: pfa
### Title: Generate PFA Document from Object
### Aliases: pfa

### ** Examples

# all the "pfa" methods found
methods("pfa")



cleanEx()
nameEx("pfa.cv.glmnet")
### * pfa.cv.glmnet

flush(stderr()); flush(stdout())

### Name: pfa.cv.glmnet
### Title: PFA Formatting of Fitted glmnet objects
### Aliases: pfa.cv.glmnet

### ** Examples

X <- matrix(c(rnorm(100), runif(100)), nrow=100, ncol=2)
Y <- factor(3 - 5 * X[,1] + 3 * X[,2] + rnorm(100, 0, 3) > 0)

model <- glmnet::cv.glmnet(X, Y, family = 'binomial')
model_as_pfa <- pfa(model)



cleanEx()
nameEx("pfa.ets")
### * pfa.ets

flush(stderr()); flush(stdout())

### Name: pfa.ets
### Title: PFA Formatting of Fitted Exponential Smoothing State Space
###   Models
### Aliases: pfa.ets

### ** Examples

model <- forecast::ets(USAccDeaths, model="ZZZ")
model_as_pfa <- pfa(model)



cleanEx()
nameEx("pfa.forecast")
### * pfa.forecast

flush(stderr()); flush(stdout())

### Name: pfa.forecast
### Title: PFA Formatting of Time Series Models Fit using Forecast Package
### Aliases: pfa.forecast

### ** Examples

model1 <- forecast::holt(airmiles)
model1_as_pfa <- pfa(model1)

model2 <- forecast::hw(USAccDeaths,h=48)
model2_as_pfa <- pfa(model2)

model3 <- forecast::ses(LakeHuron)
model3_as_pfa <- pfa(model3)



cleanEx()
nameEx("pfa.gbm")
### * pfa.gbm

flush(stderr()); flush(stdout())

### Name: pfa.gbm
### Title: PFA Formatting of Fitted GBMs
### Aliases: pfa.gbm

### ** Examples

dat <- data.frame(X1 = runif(100), 
                  X2 = rnorm(100))
dat$Y <- ((rexp(100,5) + 5 * dat$X1 - 4 * dat$X2) > 0)

bernoulli_model <- gbm::gbm(Y ~ X1 + X2, 
                            data = dat, 
                            distribution = 'bernoulli')
model_as_pfa <- pfa(bernoulli_model)



cleanEx()
nameEx("pfa.glm")
### * pfa.glm

flush(stderr()); flush(stdout())

### Name: pfa.glm
### Title: PFA Formatting of Fitted GLMs
### Aliases: pfa.glm

### ** Examples

X1 <- rnorm(100)
X2 <- runif(100)
Y <- 3 - 5 * X1 + 3 * X2 + rnorm(100, 0, 3)
Y <- Y > 0

glm_model <- glm(Y ~ X1 + X2, family = binomial(logit))
model_as_pfa <- pfa(glm_model)



cleanEx()
nameEx("pfa.glmnet")
### * pfa.glmnet

flush(stderr()); flush(stdout())

### Name: pfa.glmnet
### Title: PFA Formatting of Fitted glmnet objects
### Aliases: pfa.glmnet

### ** Examples

X <- matrix(c(rnorm(100), runif(100)), nrow=100, ncol=2)
Y <- factor(3 - 5 * X[,1] + 3 * X[,2] + rnorm(100, 0, 3) > 0)

model <- glmnet::glmnet(X, Y, family = 'binomial')
model_as_pfa <- pfa(model)



cleanEx()
nameEx("pfa.ipredknn")
### * pfa.ipredknn

flush(stderr()); flush(stdout())

### Name: pfa.ipredknn
### Title: PFA Formatting of Fitted knns
### Aliases: pfa.ipredknn

### ** Examples

iris2 <- iris
colnames(iris2) <- gsub('\\.', '_', colnames(iris2))
model <- ipred::ipredknn(Species ~ ., iris2)
model_as_pfa <- pfa(model)



cleanEx()
nameEx("pfa.kcca")
### * pfa.kcca

flush(stderr()); flush(stdout())

### Name: pfa.kcca
### Title: PFA Formatting of Fitted K-Centroid Models
### Aliases: pfa.kcca

### ** Examples

model <- flexclust::kcca(iris[,1:4], k = 3, family=flexclust::kccaFamily("kmeans"))
model_as_pfa <- pfa(model)



cleanEx()
nameEx("pfa.kccasimple")
### * pfa.kccasimple

flush(stderr()); flush(stdout())

### Name: pfa.kccasimple
### Title: PFA Formatting of Fitted K-Centroid Models
### Aliases: pfa.kccasimple

### ** Examples

model <- flexclust::kcca(iris[,1:4], k = 3, 
                         family=flexclust::kccaFamily("kmeans"), simple=TRUE)
model_as_pfa <- pfa(model)



cleanEx()
nameEx("pfa.kmeans")
### * pfa.kmeans

flush(stderr()); flush(stdout())

### Name: pfa.kmeans
### Title: PFA Formatting of Fitted K-means Models
### Aliases: pfa.kmeans

### ** Examples

model <- kmeans(x=iris[, 1:2], centers=3)
model_as_pfa <- pfa(model)



cleanEx()
nameEx("pfa.knn3")
### * pfa.knn3

flush(stderr()); flush(stdout())

### Name: pfa.knn3
### Title: PFA Formatting of Fitted knns
### Aliases: pfa.knn3

### ** Examples

iris2 <- iris
colnames(iris2) <- gsub('\\.', '_', colnames(iris2))
model <- caret::knn3(Species ~ ., iris2)
model_as_pfa <- pfa(model)



cleanEx()
nameEx("pfa.knnreg")
### * pfa.knnreg

flush(stderr()); flush(stdout())

### Name: pfa.knnreg
### Title: PFA Formatting of Fitted knns
### Aliases: pfa.knnreg

### ** Examples

model <- caret::knnreg(mpg ~ cyl + hp + am + gear + carb, data = mtcars)
model_as_pfa <- pfa(model)



cleanEx()
nameEx("pfa.lda")
### * pfa.lda

flush(stderr()); flush(stdout())

### Name: pfa.lda
### Title: PFA Formatting of Fitted Linear Discriminant Models
### Aliases: pfa.lda

### ** Examples

model <- MASS::lda(Species ~ ., data=iris)
model_as_pfa <- pfa(model)



cleanEx()
nameEx("pfa.lm")
### * pfa.lm

flush(stderr()); flush(stdout())

### Name: pfa.lm
### Title: PFA Formatting of Fitted Linear models
### Aliases: pfa.lm

### ** Examples

X1 <- rnorm(100)
X2 <- runif(100)
Y <- 3 - 5 * X1 + 3 * X2 + rnorm(100, 0, 3)

model <- lm(Y ~ X1 + X2)
model_as_pfa <- pfa(model)



cleanEx()
nameEx("pfa.naiveBayes")
### * pfa.naiveBayes

flush(stderr()); flush(stdout())

### Name: pfa.naiveBayes
### Title: PFA Formatting of Fitted naiveBayess
### Aliases: pfa.naiveBayes

### ** Examples

model <- e1071::naiveBayes(Species ~ ., data=iris) 
model_as_pfa <- pfa(model)



cleanEx()
nameEx("pfa.randomForest")
### * pfa.randomForest

flush(stderr()); flush(stdout())

### Name: pfa.randomForest
### Title: PFA Formatting of Fitted Random Forest Models
### Aliases: pfa.randomForest

### ** Examples

dat <- data.frame(X1 = runif(100), 
                  X2 = rnorm(100))
dat$Y <- factor((rexp(100,5) + 5 * dat$X1 - 4 * dat$X2) > 0)

model <- randomForest::randomForest(Y ~ X1 + X2, data=dat, ntree=10)
model_as_pfa <- pfa(model)



cleanEx()
nameEx("pfa.rpart")
### * pfa.rpart

flush(stderr()); flush(stdout())

### Name: pfa.rpart
### Title: PFA Formatting of Fitted rpart Tree Models
### Aliases: pfa.rpart

### ** Examples

model <- rpart::rpart(Species ~ ., data=iris)
model_as_pfa <- pfa(model)



cleanEx()
nameEx("pfa_cell")
### * pfa_cell

flush(stderr()); flush(stdout())

### Name: pfa_cell
### Title: pfa_cell
### Aliases: pfa_cell

### ** Examples

pfa_cell(avro_double, 12)



cleanEx()
nameEx("pfa_document")
### * pfa_document

flush(stderr()); flush(stdout())

### Name: pfa_document
### Title: pfa_document
### Aliases: pfa_document

### ** Examples

pfa_document(avro_double, avro_double, expression(input + 10))



cleanEx()
nameEx("pfa_engine")
### * pfa_engine

flush(stderr()); flush(stdout())

### Name: pfa_engine
### Title: pfa_engine
### Aliases: pfa_engine

### ** Examples

## Not run: 
##D my_pfa_doc <- pfa_document(avro_double, avro_double, expression(input + 10))
##D pfa_engine(my_pfa_doc)   # requres rPython and Titus to be installed
## End(Not run)



cleanEx()
nameEx("pfa_expr")
### * pfa_expr

flush(stderr()); flush(stdout())

### Name: pfa_expr
### Title: pfa_expr
### Aliases: pfa_expr

### ** Examples

pfa_expr(quote(2 + 2))



cleanEx()
nameEx("pfa_pool")
### * pfa_pool

flush(stderr()); flush(stdout())

### Name: pfa_pool
### Title: pfa_pool
### Aliases: pfa_pool

### ** Examples

pfa_pool(avro_double, json_map(one = 1.1, two = 2.2, three = 3.3))



cleanEx()
nameEx("read_pfa")
### * read_pfa

flush(stderr()); flush(stdout())

### Name: read_pfa
### Title: read_pfa
### Aliases: read_pfa

### ** Examples

# literal JSON string  (useful for small examples)
toy_model <- read_pfa('{"input":"double","output":"double","action":[{"+":["input",10]}]}')

# from a local path, must be wrapped in "file" command to create a connection
local_model <- read_pfa(file(system.file("extdata", "my-model.pfa", package = "aurelius")))

# from a url (split on two lines so not to exceed 100 char wide during install)
url_model <- read_pfa(url(paste0('https://raw.githubusercontent.com/ReportMort/hadrian', 
                     '/feature/add-r-package-structure/aurelius/inst/extdata/my-model.pfa')))



cleanEx()
nameEx("write_pfa")
### * write_pfa

flush(stderr()); flush(stdout())

### Name: write_pfa
### Title: write_pfa
### Aliases: write_pfa

### ** Examples

## Not run: 
##D my_pfa_doc <- pfa_document(avro_double, avro_double, expression(input + 10))
##D write_pfa(my_pfa_doc)
##D write_pfa(my_pfa_doc, file = "my-model.pfa")
## End(Not run)



### * <FOOTER>
###
cleanEx()
options(digits = 7L)
base::cat("Time elapsed: ", proc.time() - base::get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
