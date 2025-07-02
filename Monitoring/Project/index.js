const express = require("express");
const { doSomeHeavyTask } = require("./util");

const app = express();
const PORT = process.env.PORT || 8000;

const client = require("prom-client");
const collectDefaultMetrics = client.collectDefaultMetrics;

const {createLogger, transports} = require("winston");
const LokiTransport = require("winston-loki");

const logger = createLogger({
    transports: [
        new LokiTransport({
            host: "http://127.0.0.1:3100"
        })
    ]
});

collectDefaultMetrics({ register: client.register });

app.get("/metrics", async (req, res) => {   
    
    res.setHeader("Content-Type", client.register.contentType);
    const metrics = await client.register.metrics();
    res.send(metrics);
});

app.get("/", (req, res) => {
    logger.info("Request received on / route");
  return res.json({ message: `Hello from Express Server` });
});

app.get("/slow", async (req, res) => {
  try {
    logger.info("Request received on /slow route");
  const timeTaken = await doSomeHeavyTask();
  return res.json({
    status: "Success",
    message: `Heavy task completed in ${timeTaken}ms`,
  });
} catch (error) {
    logger.error("Error in /slow route", { error: error.message });
  return res
    .status(500)
    .json({ status: "Error", error: error.msg });
}
});

app.listen(PORT, () =>
  console.log(`Express Server Started at http://localhost:${PORT}`)
);
