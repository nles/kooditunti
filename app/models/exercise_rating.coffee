mongoose = require("mongoose")
userPlugin = require("mongoose-user")
Schema = mongoose.Schema

ExerciseRating = new Schema(
  eid: String
  rating: Number
  locale: String
  date: Date
)
mongoose.model('ExerciseRating', ExerciseRating)
