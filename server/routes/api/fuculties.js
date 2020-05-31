const express = require("express");
const router = express.Router();
const bcrypt = require("bcryptjs");
const jwt = require("jsonwebtoken");
const keys = require("../../config/keys");
const passport = require("passport");

// Load  Schemas
const Faculty = require("../../models/Faculty");
const FacultyUser = require("../../models/FacultyUser");
const Ticket = require("../../models/Ticket");
const StudentUser = require("../../models/StudentUser");
const Student = require("../../models/Student");

// Test
router.get("/test", (req, res) => {
  res.json("Faculty works");
});

// add facultydents details
router.post("/", (req, res) => {
  const newFaculty = new Faculty({
    name: req.body.name,
    pfId: req.body.pfId,
    department: req.body.department,
    phone: req.body.phone,
    photo: req.body.photo,
    email: req.body.email
  });
  newFaculty
    .save()
    .then(fclty => res.json(fclty))
    .catch(err => res.json(err));
});

// Get all facultydents
router.get("/", (req, res) => {
  Faculty.findOne({ pfId: req.body.pfId })
    .then(fclty => res.json(fclty))
    .catch(err => res.json(err));
});

// Signup
router.post("/signup", (req, res) => {
  const pfId = req.body.pfId;
  const password = req.body.password;
  Faculty.findOne({ pfId: pfId }).then(faculty => {
    console.log(faculty);
    if (faculty === null) {
      res.status(404).json({ msg: "Faculty not found" });
      return;
    } else {
      FacultyUser.findOne({ faculty: faculty._id }).then(user => {
        console.log(user);
        if (user) {
          return res.status(400).json("You already registered");
        } else {
          const newUser = new FacultyUser({
            faculty: faculty.id,
            pfId: pfId,
            password: password
          });

          bcrypt.genSalt(10, (err, salt) => {
            bcrypt.hash(newUser.password, salt, (err, hash) => {
              if (err) throw err;
              newUser.password = hash;

              newUser
                .save()
                .then(user => {
                  const payload = {
                    id: user.id,
                    pfId: pfId
                  };
                  jwt.sign(
                    payload,
                    keys.secretOrKey,
                    { expiresIn: 86400 },
                    (err, token) => {
                      res.json({
                        success: true,
                        token: "Bearer " + token
                      });
                    }
                  );
                })
                .catch(err => res.json(err));
            });
          });
        }
      });
    }
  });
});

// Login
router.post("/login", (req, res) => {
  pfId = req.body.pfId;
  password = req.body.password;

  FacultyUser.findOne({ pfId: pfId }).then(user => {
    if (!user) {
      // errors.email = "User not found";
      res.status(404).json({ msg: "You are not registered" });
    }
    bcrypt.compare(password, user.password).then(isMatch => {
      if (isMatch) {
        console.log("userid:" + user.id);
        const payload = {
          id: user.id,
          pfId: pfId
        };
        jwt.sign(
          payload,
          keys.secretOrKey,
          { expiresIn: 86400 },
          (err, token) => {
            res.json({
              success: true,
              token: "Bearer " + token
            });
          }
        );
      } else {
        return res.status(400).json({ msg: "Incorrect Password" });
      }
    });
  });
});

router.get(
  "/getStudentInfo/:sid",
  passport.authenticate("faculty", { session: false }),
  (req, res) => {
    StudentUser.findById(req.params.sid)
      .then(user =>
        Student.findOne({ admissionNumber: user.admissionNumber })
          .then(studentInfo => {
            res.json(studentInfo);
          })
          .catch(err => console.log(err))
      )
      .catch(error => console.log(error));
  }
);

router.get(
  "/ticketsReceived",
  passport.authenticate("faculty", { session: false }),
  (req, res) => {
    fid = 0;
    console.log(req.user.id);

    FacultyUser.findOne({ _id: req.user._id })
      .then(item => {
        fid = item.pfId;
        console.log(fid);

        Ticket.find({ fid: fid })
          .then(tickets => {
            console.log(tickets);
            res.status(200).json(tickets);
          })
          .catch(err => {
            console.log(err),
              res.status(500).json({
                note: "error report:no tickets found",
                error: err
              });
          });
      })
      .catch(err => console.log(err));
  }
);

router.get(
  "/ticketsReceived/:id",
  passport.authenticate("faculty", { session: false }),
  (req, res) => {
    Ticket.findById(req.params.id) // idu egane nammal front endil ninnu pass cheyum?ticket id
      .then(ticket => {
        res.status(200).json(ticket);
      })
      .catch(err => {
        res.status(500).json({
          note: "error report:no tickets found",
          error: err
        });
      });
  }
);

router.patch(
  "/ticket/:id",
  passport.authenticate("faculty", { session: false }),
  (req, res) => {
    const status = {
      approved: req.body.approved,
      faculty: req.user.id,
      message: req.body.message
    };
    Ticket.findOneAndUpdate(
      { _id: req.params.id }, //why did we use _ here before id,is it bcz we are refering to the unique id automatically applied
      {
        $push: {
          status: status
        }
      },
      { new: true }
    )
      .then(ticket => res.json(ticket))
      .catch(err => res.json(err));
  }
);

router.patch(
  "/sendTicket/:id",
  passport.authenticate("faculty", { session: false }),
  (req, res) => {
    fid = req.body.fid;
    Ticket.findOneAndUpdate(
      { _id: req.params.id },
      {
        $set: {
          fid: req.body.fid
        }
      },
      { new: true }
    )
      .then(ticket => res.json(ticket))
      .catch(err => res.json(err));
  }
);

module.exports = router;
