const MONGO_ROOT_USER = process.env["MONGO_ROOT_USER"];
const MONGO_ROOT_PASSWORD = process.env["MONGO_ROOT_PASSWORD"];

db.version();

use("admin");

db.auth(MONGO_ROOT_USER, MONGO_ROOT_PASSWORD);

rs.initiate({
  _id: "rs0",
  members: [
    {
      _id: 0,
      host: "localhost:27017",
      priority: 2,
    },
    {
      _id: 1,
      host: "localhost:27018",
      priority: 0,
    },
    {
      _id: 2,
      host: "localhost:27019",
      priority: 0,
    },
  ],
});

db.getMongo().setReadPref("primaryPreferred");

rs.status();

exit;
