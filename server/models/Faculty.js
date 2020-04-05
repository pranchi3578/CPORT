const mongoose = require("mongoose");
const Schema = mongoose.Schema;

// Create Schema
const StudentSchema = new Schema({
  name: {
    type: String,
    required: true
  },
  pfId: {
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
 
});

module.exports = Student = mongoose.model("faculties", StudentSchema);
