const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const StudentUserSchema = new Schema({
  student: {
    type: Schema.Types.ObjectId,
    ref: "students"
  },
  admissionNumber: {
    type: String
  },
  password: {
    type: String
  }
});

module.exports = StudentUser = mongoose.model(
  "studentUsers",
  StudentUserSchema
);
