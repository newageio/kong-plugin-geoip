#Kong plugin GeoIP

# API
POST :8001/plugins
```
{
	"name": "geoip",
	"config.blacklist_countries": ["UA", "UK"],
	"config.whitelist_ips": ["37.73.161.34"]
}
```

# Tests
Plugin only manualy tested.
Automated only `schema_spec`

# Todo:
- User-agent whitelist for SEO bots
- Blocking by city
- Write tests

Todo: Fix problem with tests:
```
vagrant@vagrant-ubuntu-trusty-64:/kong$ bin/busted -f kong.conf.default /kong-plugin/spec/
●●●●●●
6 successes / 0 failures / 2 errors / 0 pending : 3.21529 seconds

Error → /kong-plugin/spec/geoip/02-access_spec.lua @ 9
Plugin: geoip (access) setup
/kong-plugin/spec/geoip/02-access_spec.lua:28: 2018/05/30 22:10:41 [warn] postgres database 'kong_tests' is missing migration: (geoip) 2018-05-30-init
Error: ./kong/cmd/start.lua:34: [postgres error] the current database schema does not match this version of Kong. Please run `kong migrations up` to update/initialize the database schema. Be aware that Kong migrations should only run from a single node, and that nodes running migrations concurrently will conflict with each other and might corrupt your database schema!

  Run with --v (verbose) or --vv (debug) for more details


Error → /kong-plugin/spec/geoip/02-access_spec.lua @ 9
Plugin: geoip (access) setup
/kong-plugin/spec/geoip/02-access_spec.lua:28: 2018/05/30 22:10:43 [warn] postgres database 'kong_tests' is missing migration: (geoip) 2018-05-30-init
Error: ./kong/cmd/start.lua:34: [postgres error] the current database schema does not match this version of Kong. Please run `kong migrations up` to update/initialize the database schema. Be aware that Kong migrations should only run from a single node, and that nodes running migrations concurrently will conflict with each other and might corrupt your database schema!

  Run with --v (verbose) or --vv (debug) for more details

vagrant@vagrant-ubuntu-trusty-64:/kong$
```