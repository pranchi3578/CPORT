const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const TicketSchema = new Schema({
  student: {
    type: Schema.Types.ObjectId,
    ref: "studentUser"
  },
  subject: {
    type: String,
    required: true
  },

  content: {
    type: String,
    required: true
  },

  image: [String],
  doc: [String],
  fid: {
    type: Schema.Types.ObjectId,
    ref: "faculties"
  }
});

module.exports = Ticket = mongoose.model("tickets", TicketSchema);
