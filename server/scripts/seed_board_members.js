require("dotenv").config();
const fs = require("fs");
const path = require("path");
const { sequelize, LeadershipMember } = require("../models");

async function main() {
  const file = path.join(__dirname, "../seeds/board_members.json");
  const raw = fs.readFileSync(file, "utf-8");
  const data = JSON.parse(raw);

  await sequelize.authenticate();
  await sequelize.sync();

  // Upsert by name and category
  for (const item of data) {
    const [row] = await LeadershipMember.findOrCreate({
      where: { name: item.name, category: 'Board Member' },
      defaults: {
        name: item.name,
        position: item.position,
        category: 'Board Member',
        image: item.image || null,
        description: null,
        achievementsJson: null,
        experience: null,
        education: null,
        color: null,
        order: item.order,
        isActive: !!item.isActive,
      },
    });
    if (row) {
      await row.update({
        position: item.position,
        image: item.image || null,
        order: item.order,
        isActive: !!item.isActive,
      });
    }
  }

  console.log("✅ Seeded board members");
  await sequelize.close();
}

main().catch(async (e) => {
  console.error("❌ Seed failed:", e);
  try { await sequelize.close(); } catch (_) {}
  process.exit(1);
});

