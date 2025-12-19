const router = require("express").Router();
const ctrl = require("../controllers/investors_cms");
const auth = require("../middlewares/auth");

// Hero
router.get("/hero", ctrl.hero.get);
router.put("/hero", auth.authCheck, ctrl.hero.upsert);

// Stock Quote
router.get("/stock-quote", ctrl.stockQuote.get);
router.put("/stock-quote", auth.authCheck, ctrl.stockQuote.upsert);

// Stock Chart
router.get("/stock-chart", ctrl.stockChart.get);
router.put("/stock-chart", auth.authCheck, ctrl.stockChart.upsert);

// Historical Stock Quote
router.get("/historical-stock-quote", ctrl.historicalStockQuote.get);
router.put("/historical-stock-quote", auth.authCheck, ctrl.historicalStockQuote.upsert);

// Related Links Section
router.get("/related-links/section", ctrl.relatedLinks.getSection);
router.put("/related-links/section", auth.authCheck, ctrl.relatedLinks.upsertSection);

// Related Links
router.get("/related-links", ctrl.relatedLinks.getAllLinks);
router.post("/related-links", auth.authCheck, ctrl.relatedLinks.createLink);
router.put("/related-links/:id", auth.authCheck, ctrl.relatedLinks.updateLink);
router.delete("/related-links/:id", auth.authCheck, ctrl.relatedLinks.deleteLink);

// Key Personnel
router.get("/key-personnel", ctrl.relatedLinks.getAllPersonnel);
router.post("/key-personnel", auth.authCheck, ctrl.relatedLinks.createPersonnel);
router.put("/key-personnel/:id", auth.authCheck, ctrl.relatedLinks.updatePersonnel);
router.delete("/key-personnel/:id", auth.authCheck, ctrl.relatedLinks.deletePersonnel);

// Investor Page Content
router.get("/page-content", ctrl.pageContent.getAll);
router.get("/page-content/slug/:slug", ctrl.pageContent.getBySlug);
router.post("/page-content", auth.authCheck, ctrl.pageContent.create);
router.put("/page-content/:id", auth.authCheck, ctrl.pageContent.update);
router.delete("/page-content/:id", auth.authCheck, ctrl.pageContent.delete);

module.exports = router;

