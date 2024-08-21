const express = require("express");
const bodyParser = require("body-parser");
const jwt = require("jsonwebtoken");
const cookieParser = require("cookie-parser");

const app = express();
const port = 3000;
const secretKey = "your_secret_key";

app.use(bodyParser.json());
app.use(cookieParser());

// 模拟用户数据库
const users = [{ username: "a", password: "123" }];
app.use((req, res, next) => {
  res.header("Access-Control-Allow-Origin", "http://localhost:5173");
  res.header("Access-Control-Allow-Credentials", "true");
  res.header("Access-Control-Allow-Methods", "GET,HEAD,OPTIONS,POST,PUT");
  res.header(
    "Access-Control-Allow-Headers",
    "Origin, X-Requested-With, Content-Type, Accept, Authorization"
  );
  next();
});
// 注册路由
app.post("/register", (req, res) => {
  const { username, password } = req.body;
  if (users.find((user) => user.username === username)) {
    return res.status(400).send("User already exists");
  }
  users.push({ username, password });
  res.status(201).send("User registered");
});

// 登录路由
app.post("/login", (req, res) => {
  console.log(123);
  const { username, password } = req.body;
  const user = users.find(
    (user) => user.username === username && user.password === password
  );
  if (!user) {
    return res.status(401).send("Invalid credentials");
  }
  const accessToken = jwt.sign({ username }, secretKey, { expiresIn: "15m" });
  const refreshToken = jwt.sign({ username }, secretKey, { expiresIn: "7d" });

  res.cookie("accessToken", accessToken, {
    httpOnly: true,
    maxAge: 60 * 1000,
    // path: "/protected",
  });
  res.cookie("refreshToken", refreshToken, {
    httpOnly: true,
    maxAge: 7 * 24 * 60 * 60 * 1000,
    // path: "/token",
  });
  res.json({ message: "Logged in successfully" });
});

// 刷新令牌路由
app.post("/token", (req, res) => {
  console.log("refresh");
  const refreshToken = req.cookies.refreshToken;
  if (!refreshToken) {
    return res.status(401).send("Access denied");
  }
  try {
    const decoded = jwt.verify(refreshToken, secretKey);
    const accessToken = jwt.sign({ username: decoded.username }, secretKey, {
      expiresIn: "1m",
    });
    res.cookie("accessToken", accessToken, {
      httpOnly: true,
      maxAge: 60 * 1000,
      // path: "/protected",
    });
    res.json({ message: "Token refreshed successfully" });
  } catch (err) {
    res.status(401).send("Invalid token");
  }
});

// 受保护的路由
app.get("/protected", (req, res) => {
  const accessToken = req.cookies.accessToken;
  if (!accessToken) {
    return res.status(401).send("Access denied");
  }
  try {
    const decoded = jwt.verify(accessToken, secretKey);
    res.json({ message: "Protected data", user: decoded });
  } catch (err) {
    res.status(401).send("Invalid token");
  }
});

app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}`);
});
