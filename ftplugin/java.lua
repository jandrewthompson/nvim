-- local jdtls = require('jdtls')
-- 
-- local config = {
--   settings = {
--     java = {
--       configuration = {
--         -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
--         -- And search for `interface RuntimeOption`
--         -- The `name` is NOT arbitrary, but must match one of the elements from `enum ExecutionEnvironment` in the link above
--         runtimes = {
--           {
--             name = "JavaSE-11",
--             path = "/usr/lib/jvm/java-11-openjdk/",
--           },
--           {
--             name = "JavaSE-17",
--             path = "/usr/lib/jvm/java-17-openjdk/",
--           },
--         }
--       }
--     }
--   }
-- }
-- jdtls.start_or_attach(config)
-- 
