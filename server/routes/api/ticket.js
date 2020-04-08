const express = require("express");
const router = express.Router();
const passport = require("passport");
const Ticket = require("../../models/Ticket");
const multer = require("multer");
const storage = multer.memoryStorage();
const upload = multer({ storage: storage });
router.get("/ticket", (req, res) => {
  res.status(502).json(res);
});

router.post(
  "/ticket",
  upload.fields(),
  passport.authenticate("jwt", { session: false }),
  (req, res, error) => {
    const newTicket = new Ticket({
      student: req.user.id,
      content: req.body.content,
      subject: req.body.subject,
      image: req.body.image,
      doc: req.body.doc
    });
    Ticket.findOne({ student: req.user.id })
      .then(request => {
        newTicket
          .save()
          .then(ticket => res.json(ticket))
          .catch(err => res.json(err));
      })

      .catch(error => res.json(error));

    res.status(200).json(res);
  }
);
