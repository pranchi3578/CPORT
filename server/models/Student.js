const mongoose = require("mongoose");
const Schema = mongoose.Schema;

// Create Schema
const StudentSchema = new Schema({
  name: {
    type: String,
    required: true
  },
  admissionNumber: {
    type: Number,
    required: true
  },
  department: {
    type: String,
    required: true
  },
  phone: {
    type: String,
    required: true
  },
  photo: {
    type: String
  },
  email: {
    type: String
  },
  password: {
    type: String
  }
});

module.exports = Student = mongoose.model("students", StudentSchema);
