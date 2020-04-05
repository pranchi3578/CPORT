const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const FacultyUserSchema = new Schema({
  faculty: {
    type: Schema.Types.ObjectId,
    ref: "faculties"
  },
  pfId: {
    type: Number
  },
  password: {
    type: String
  }
});

module.exports = FacultyUser = mongoose.model(
  "facultyUsers",
  FacultyUserSchema
);
