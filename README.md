# Kong plugin GeoIP
- Why?
It just wrapper for using geo-ip with UI's for Kong.

# Installation
http://luarocks.org/modules/newage/kong-plugin-geoip

`luarocks install kong-plugin-geoip`

You must now add the custom plugin's name to the custom_plugins list in your Kong configuration (on each Kong node):
```
custom_plugins = geoip
```

Note: you can also set this property via its environment variable equivalent: `KONG_CUSTOM_PLUGINS`.

`Reminder: don't forget to update the custom_plugins directive for each node in your Kong cluster.`

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

- Routes / APIs attaching 
- Add to KongaUI
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

# Links
Thanks @agladysh for https://github.com/agladysh/lua-geoip


## License

```
Copyright 2016-2018 Kong Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
