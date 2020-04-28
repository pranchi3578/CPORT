const express = require("express");
const router = express.Router();
const multer = require("multer");
const passport = require("passport");
const Ticket = require("../../models/Ticket");

const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, "uploads/");
  },
  filename: function (req, file, cb) {
    cb(null, file.originalname);
  },
});
const fileFilter = (req, file, cb) => {
  if (file.mimetype === "image/jpg" || file.mimetype === "image/png") {
    cb(null, true);
  } else {
    cb(null, false);
  }
};

const upload = multer({
  storage: storage,
  limits: {
    fileSize: 1024 * 1024 * 5,
  },
  fileFilter: fileFilter,
});

router.get(
  "/",
  passport.authenticate("student", { session: false }),
  (req, res) => {
    Ticket.find({ student: req.user.id })
      .then((tickets) => {
        res.json(tickets);
        console.log(tickets + "are the tickets");
      })
      .catch((err) => res.status(500).json(err));
  }
);

router.post(
  "/",
  passport.authenticate("student", { session: false }),
  upload.single("image"),
  (req, res, error) => {
    console.log("hiii");
    console.log(req.file);
    const newTicket = new Ticket({
      student: req.user.id,
      content: req.body.content,
      subject: req.body.subject,
      image: req.file.path,
      fid: req.body.fid,
    });
    Ticket.findOne({ student: req.user.id })
      .then((request) => {
        newTicket.save().then((ticket) => res.json(ticket));
      })

      .catch((error) => res.json(error));

    // res.status(200).json(res);
  }
);

router.get(
  "/:id",
  passport.authenticate("student", { session: false }),
  (req, res) => {
    Ticket.findById(req.params.id)
      .then((ticket) => {
        res.status(200).json(ticket);
      })
      .catch((err) => {
        res.status(500).json({
          note: "error report:no tickets found",
          error: err,
        });
      });
  }
);

module.exports = router;
