const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const TicketSchema = new Schema({
  student: {
    type: Schema.Types.ObjectId,
    ref: "studentUser",
  },
  fid: {
    type: Schema.Types.ObjectId,
    ref: "faculties",
  },
  status: [
    {
      faculty: {
        type: Schema.Types.ObjectId,
        ref: "faculties",
      },
      approved: {
        type: Boolean,
        default: false,
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

  image: [String],
  doc: [String],
});

module.exports = Ticket = mongoose.model("tickets", TicketSchema);
