// const multer = require("multer");

function uploadFile(field) {
    let storage = multer.diskStorage({
        destination: function(req, file, cb) {
            const img = {
                url: `./public/images/uploads`,
                typeJpg: "image/jpeg",
                typePng: "image/png",
            };
            const mp3 = {
                url: `./public/sound/uploads`,
                type: "audio/mpeg",
            };
            const video = {
                url: `./public/video/`,
                type: "video/mp4",
            };

            let dest;
            if (file.mimetype === img.typeJpg || file.mimetype === img.typePng) {
                dest = img.url;
            } else if (file.mimetype === mp3.type) {
                dest = mp3.url;
            } else if (file.mimetype === video.type) {
                dest = video.url;
            }
            if (dest == null) {
                cb("Fichero no válido", null);
                return;
            }
            cb(null, dest);
        },
        filename: function(req, file, cb) {
            console.log(file);
            const extension = file.originalname.slice(
                file.originalname.lastIndexOf(".")
            );
            cb(null, Date.now() + extension);
        },
    });
    let upload = multer({ storage }).single(field);
    return upload;
}

module.exports = uploadFile;


const multer = require('multer');
const path = require('path');

const storage = multer.diskStorage({
    destination: function(req, file, cb) {
        cb(null, 'public/images');
    },

    filename: function(req, file, cb) {
        cb(null, Date.now() + path.extname(file.originalname));
    }
});

const upload = multer({ storage: storage }).single('img');

module.exports = upload;

// const multer = require('multer');
// const path = require('path');

// const storage = multer.diskStorage({
//     destination: function(req, file, cb) {
//         cb(null, 'public/images');
//     },

//     filename: function(req, file, cb) {
//         cb(null, Date.now() + path.extname(file.originalname));
//     }
// });

// const upload = multer({ storage: storage }).single('img');

// module.exports = upload;