const MONGO_ROOT_USER = process.env["MONGO_ROOT_USER"];
const MONGO_ROOT_PASSWORD = process.env["MONGO_ROOT_PASSWORD"];

use("admin");

db.createUser({
  user: MONGO_ROOT_USER,
  pwd: MONGO_ROOT_PASSWORD,
  roles: [
    {
      role: "root",
      db: "admin",
    },
  ],
});

db.shutdownServer();

exit;
