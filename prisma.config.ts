import { defineConfig } from "prisma/config";

export default defineConfig({
  schema: "prisma/schema.prisma",
  migrations: {
    path: "prisma/migrations",
  },
  engine: "classic",
  datasource: {
    url: "postgresql://neondb_owner:npg_v4KdqtLehlf8@ep-red-bird-a1o3486n-pooler.ap-southeast-1.aws.neon.tech/monorepo?sslmode=require&channel_binding=require",
  },
});
