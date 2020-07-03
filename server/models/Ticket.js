const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const TicketSchema = new Schema({
  student: {
    type: Schema.Types.ObjectId,
    ref: "studentUser",
  },
  fid: {
    type: String,
    required: true,
  },
  approved: {
    type: Number,
    default: 3,
  },
  status: [
    {
      faculty: {
        type: Schema.Types.ObjectId,
        ref: "facultyUsers",
      },
      approved: {
        type: Number,
        default: 3,
      },
      message: {
        type: String,
      },
    },
  ],

  subject: {
    type: String,
    required: true,
  },

  content: {
    type: String,
    required: true,
  },
  date: {
    type: Date,
  },

  image: [],
  doc: [String],
});

module.exports = Ticket = mongoose.model("tickets", TicketSchema);
