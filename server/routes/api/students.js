const express = require("express");
const router = express.Router();
const bcrypt = require("bcryptjs");
const jwt = require("jsonwebtoken");
const keys = require("../../config/keys");
const passport = require("passport");

// Load  Schemas
const Student = require("../../models/Student");
const StudentUser = require("../../models/StudentUser");
const Ticket = require("../../models/Ticket");
const Faculty = require("../../models/Faculty");

// Test
router.get("/test", (req, res) => {
  res.json("Students works");
});

// add students details
router.post("/", (req, res) => {
  const newStudent = new Student({
    name: req.body.name,
    admissionNumber: req.body.admissionNumber,
    department: req.body.department,
    phone: req.body.phone,
    photo: req.body.photo,
    email: req.body.email
  });
  newStudent
    .save()
    .then(student => res.json(student))
    .catch(err => res.json(err));
});

// Get all students
router.get("/", (req, res) => {
  Student.findOne({ admissionNumber: req.body.admissionNumber })
    .then(stu => res.json(stu))
    .catch(err => res.json(err));
});

// Signup
router.post("/signup", (req, res) => {
  const admissionNumber = req.body.admissionNumber;
  const password = req.body.password;
  Student.findOne({ admissionNumber: admissionNumber }).then(stu => {
    console.log(stu);
    if (stu === null) {
      res.status(404).json({ msg: "Student not found" });
      return;
    } else {
      StudentUser.findOne({ student: stu._id }).then(user => {
        console.log(user);
        if (user) {
          return res.status(400).json({ msg: "You already registered" });
        } else {
          const newUser = new StudentUser({
            student: stu.id,
            admissionNumber: admissionNumber,
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
                    admissionNumber: admissionNumber
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
                .catch(err => res.json({ msg: "Something went wrong" }));
            });
          });
        }
      });
    }
  });
});

// Login
router.post("/login", (req, res) => {
  admissionNumber = req.body.admissionNumber;
  password = req.body.password;

  StudentUser.findOne({ admissionNumber: admissionNumber })
    .then(user => {
      if (!user) {
        // errors.email = "User not found";
        res.status(404).json({ msg: "You are not registered" });
      }
      bcrypt.compare(password, user.password).then(isMatch => {
        if (isMatch) {
          const payload = {
            id: user.id,
            admissionNumber: admissionNumber
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
    })
    .catch(err => res.json({ msg: "Something went wrong" }));
});

router.get(
  "/getfId/:department",
  passport.authenticate("student", { session: false }),
  (req, res) => {
    department = req.params.department;
    Faculty.find({ department: department })
      .select("pfId name")
      .then(faculty => {
        if (faculty.length === 0) {
          return res.status(404).json([]);
        }
        res.status(200).json(faculty);
      })
      .catch(err => res.status(500).json(err));
  }
);
module.exports = router;
