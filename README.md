This is the simplest way I could reproduce [https://github.com/activerecord-hackery/ransack/issues/310](http://)

There is a single scaffold-ed model, `Cheese`

```
bundle install
bundle exec rake db:migrate
bundle exec rails s
visit http://localhost:3000
```

This is the error

![http://i.imgur.com/LWVTSp9.png](http://i.imgur.com/LWVTSp9.png)

```
I18n::MissingInterpolationArgument in Cheeses#index
Showing /Users/john/Code/Labs/ransacktest/app/views/cheeses/index.html.erb where line #6 raised:

missing interpolation argument :attributes in "%{attributes}" ({:count=>1, :attr_fallback_name=>"%{attributes}"} given)
Extracted source (around line #6):
3
4
5
6
7
8
9

  <table>
    <thead>
      <tr>
        <td><%= sort_link @q, :id %></td>
        <td><%= sort_link @q, :name %></td>
        <th></th>
        <th></th>

Rails.root: /Users/john/Code/Labs/ransacktest

Application Trace | Framework Trace | Full Trace
i18n (0.6.5) lib/i18n/config.rb:72:in `block in missing_interpolation_argument_handler'
i18n (0.6.5) lib/i18n/interpolate/ruby.rb:29:in `call'
i18n (0.6.5) lib/i18n/interpolate/ruby.rb:29:in `block in interpolate_hash'
i18n (0.6.5) lib/i18n/interpolate/ruby.rb:21:in `gsub'
i18n (0.6.5) lib/i18n/interpolate/ruby.rb:21:in `interpolate_hash'
i18n (0.6.5) lib/i18n/interpolate/ruby.rb:17:in `interpolate'
i18n (0.6.5) lib/i18n/backend/base.rb:149:in `interpolate'
i18n (0.6.5) lib/i18n/backend/base.rb:41:in `translate'
i18n (0.6.5) lib/i18n.rb:156:in `block in translate'
i18n (0.6.5) lib/i18n.rb:152:in `catch'
i18n (0.6.5) lib/i18n.rb:152:in `translate'
/usr/local/var/rbenv/versions/2.0.0-p353/lib/ruby/gems/2.0.0/bundler/gems/ransack-98948773e48c/lib/ransack/translate.rb:90:in `attribute_name'
/usr/local/var/rbenv/versions/2.0.0-p353/lib/ruby/gems/2.0.0/bundler/gems/ransack-98948773e48c/lib/ransack/translate.rb:30:in `block in attribute'
/usr/local/var/rbenv/versions/2.0.0-p353/lib/ruby/gems/2.0.0/bundler/gems/ransack-98948773e48c/lib/ransack/translate.rb:29:in `map'
/usr/local/var/rbenv/versions/2.0.0-p353/lib/ruby/gems/2.0.0/bundler/gems/ransack-98948773e48c/lib/ransack/translate.rb:29:in `attribute'
/usr/local/var/rbenv/versions/2.0.0-p353/lib/ruby/gems/2.0.0/bundler/gems/ransack-98948773e48c/lib/ransack/helpers/form_helper.rb:40:in `sort_link'
app/views/cheeses/index.html.erb:6:in `_app_views_cheeses_index_html_erb___2794422142149822260_70137332105860'
actionpack (4.0.1) lib/action_view/template.rb:143:in `block in render'
activesupport (4.0.1) lib/active_support/notifications.rb:161:in `instrument'
actionpack (4.0.1) lib/action_view/template.rb:141:in `render'
actionpack (4.0.1) lib/action_view/renderer/template_renderer.rb:49:in `block (2 levels) in render_template'
actionpack (4.0.1) lib/action_view/renderer/abstract_renderer.rb:38:in `block in instrument'
activesupport (4.0.1) lib/active_support/notifications.rb:159:in `block in instrument'
activesupport (4.0.1) lib/active_support/notifications/instrumenter.rb:20:in `instrument'
activesupport (4.0.1) lib/active_support/notifications.rb:159:in `instrument'
actionpack (4.0.1) lib/action_view/renderer/abstract_renderer.rb:38:in `instrument'
actionpack (4.0.1) lib/action_view/renderer/template_renderer.rb:48:in `block in render_template'
actionpack (4.0.1) lib/action_view/renderer/template_renderer.rb:56:in `render_with_layout'
actionpack (4.0.1) lib/action_view/renderer/template_renderer.rb:47:in `render_template'
actionpack (4.0.1) lib/action_view/renderer/template_renderer.rb:17:in `render'
actionpack (4.0.1) lib/action_view/renderer/renderer.rb:42:in `render_template'
actionpack (4.0.1) lib/action_view/renderer/renderer.rb:23:in `render'
actionpack (4.0.1) lib/abstract_controller/rendering.rb:127:in `_render_template'
actionpack (4.0.1) lib/action_controller/metal/streaming.rb:219:in `_render_template'
actionpack (4.0.1) lib/abstract_controller/rendering.rb:120:in `render_to_body'
actionpack (4.0.1) lib/action_controller/metal/rendering.rb:33:in `render_to_body'
actionpack (4.0.1) lib/action_controller/metal/renderers.rb:26:in `render_to_body'
actionpack (4.0.1) lib/abstract_controller/rendering.rb:97:in `render'
actionpack (4.0.1) lib/action_controller/metal/rendering.rb:16:in `render'
actionpack (4.0.1) lib/action_controller/metal/instrumentation.rb:41:in `block (2 levels) in render'
activesupport (4.0.1) lib/active_support/core_ext/benchmark.rb:12:in `block in ms'
/usr/local/var/rbenv/versions/2.0.0-p353/lib/ruby/2.0.0/benchmark.rb:296:in `realtime'
activesupport (4.0.1) lib/active_support/core_ext/benchmark.rb:12:in `ms'
actionpack (4.0.1) lib/action_controller/metal/instrumentation.rb:41:in `block in render'
actionpack (4.0.1) lib/action_controller/metal/instrumentation.rb:84:in `cleanup_view_runtime'
activerecord (4.0.1) lib/active_record/railties/controller_runtime.rb:25:in `cleanup_view_runtime'
actionpack (4.0.1) lib/action_controller/metal/instrumentation.rb:40:in `render'
actionpack (4.0.1) lib/action_controller/metal/implicit_render.rb:10:in `default_render'
actionpack (4.0.1) lib/action_controller/metal/implicit_render.rb:5:in `send_action'
actionpack (4.0.1) lib/abstract_controller/base.rb:189:in `process_action'
actionpack (4.0.1) lib/action_controller/metal/rendering.rb:10:in `process_action'
actionpack (4.0.1) lib/abstract_controller/callbacks.rb:18:in `block in process_action'
activesupport (4.0.1) lib/active_support/callbacks.rb:423:in `_run__3684279753803104081__process_action__callbacks'
activesupport (4.0.1) lib/active_support/callbacks.rb:80:in `run_callbacks'
actionpack (4.0.1) lib/abstract_controller/callbacks.rb:17:in `process_action'
actionpack (4.0.1) lib/action_controller/metal/rescue.rb:29:in `process_action'
actionpack (4.0.1) lib/action_controller/metal/instrumentation.rb:31:in `block in process_action'
activesupport (4.0.1) lib/active_support/notifications.rb:159:in `block in instrument'
activesupport (4.0.1) lib/active_support/notifications/instrumenter.rb:20:in `instrument'
activesupport (4.0.1) lib/active_support/notifications.rb:159:in `instrument'
actionpack (4.0.1) lib/action_controller/metal/instrumentation.rb:30:in `process_action'
actionpack (4.0.1) lib/action_controller/metal/params_wrapper.rb:245:in `process_action'
activerecord (4.0.1) lib/active_record/railties/controller_runtime.rb:18:in `process_action'
actionpack (4.0.1) lib/abstract_controller/base.rb:136:in `process'
actionpack (4.0.1) lib/abstract_controller/rendering.rb:44:in `process'
actionpack (4.0.1) lib/action_controller/metal.rb:195:in `dispatch'
actionpack (4.0.1) lib/action_controller/metal/rack_delegation.rb:13:in `dispatch'
actionpack (4.0.1) lib/action_controller/metal.rb:231:in `block in action'
actionpack (4.0.1) lib/action_dispatch/routing/route_set.rb:80:in `call'
actionpack (4.0.1) lib/action_dispatch/routing/route_set.rb:80:in `dispatch'
actionpack (4.0.1) lib/action_dispatch/routing/route_set.rb:48:in `call'
actionpack (4.0.1) lib/action_dispatch/journey/router.rb:71:in `block in call'
actionpack (4.0.1) lib/action_dispatch/journey/router.rb:59:in `each'
actionpack (4.0.1) lib/action_dispatch/journey/router.rb:59:in `call'
actionpack (4.0.1) lib/action_dispatch/routing/route_set.rb:680:in `call'
rack (1.5.2) lib/rack/etag.rb:23:in `call'
rack (1.5.2) lib/rack/conditionalget.rb:25:in `call'
rack (1.5.2) lib/rack/head.rb:11:in `call'
actionpack (4.0.1) lib/action_dispatch/middleware/params_parser.rb:27:in `call'
actionpack (4.0.1) lib/action_dispatch/middleware/flash.rb:241:in `call'
rack (1.5.2) lib/rack/session/abstract/id.rb:225:in `context'
rack (1.5.2) lib/rack/session/abstract/id.rb:220:in `call'
actionpack (4.0.1) lib/action_dispatch/middleware/cookies.rb:486:in `call'
activerecord (4.0.1) lib/active_record/query_cache.rb:36:in `call'
activerecord (4.0.1) lib/active_record/connection_adapters/abstract/connection_pool.rb:626:in `call'
activerecord (4.0.1) lib/active_record/migration.rb:369:in `call'
actionpack (4.0.1) lib/action_dispatch/middleware/callbacks.rb:29:in `block in call'
activesupport (4.0.1) lib/active_support/callbacks.rb:373:in `_run__3239551073344703575__call__callbacks'
activesupport (4.0.1) lib/active_support/callbacks.rb:80:in `run_callbacks'
actionpack (4.0.1) lib/action_dispatch/middleware/callbacks.rb:27:in `call'
actionpack (4.0.1) lib/action_dispatch/middleware/reloader.rb:64:in `call'
actionpack (4.0.1) lib/action_dispatch/middleware/remote_ip.rb:76:in `call'
actionpack (4.0.1) lib/action_dispatch/middleware/debug_exceptions.rb:17:in `call'
actionpack (4.0.1) lib/action_dispatch/middleware/show_exceptions.rb:30:in `call'
railties (4.0.1) lib/rails/rack/logger.rb:38:in `call_app'
railties (4.0.1) lib/rails/rack/logger.rb:20:in `block in call'
activesupport (4.0.1) lib/active_support/tagged_logging.rb:67:in `block in tagged'
activesupport (4.0.1) lib/active_support/tagged_logging.rb:25:in `tagged'
activesupport (4.0.1) lib/active_support/tagged_logging.rb:67:in `tagged'
railties (4.0.1) lib/rails/rack/logger.rb:20:in `call'
actionpack (4.0.1) lib/action_dispatch/middleware/request_id.rb:21:in `call'
rack (1.5.2) lib/rack/methodoverride.rb:21:in `call'
rack (1.5.2) lib/rack/runtime.rb:17:in `call'
activesupport (4.0.1) lib/active_support/cache/strategy/local_cache.rb:83:in `call'
rack (1.5.2) lib/rack/lock.rb:17:in `call'
actionpack (4.0.1) lib/action_dispatch/middleware/static.rb:64:in `call'
rack (1.5.2) lib/rack/sendfile.rb:112:in `call'
railties (4.0.1) lib/rails/engine.rb:511:in `call'
railties (4.0.1) lib/rails/application.rb:97:in `call'
rack (1.5.2) lib/rack/lock.rb:17:in `call'
rack (1.5.2) lib/rack/content_length.rb:14:in `call'
rack (1.5.2) lib/rack/handler/webrick.rb:60:in `service'
/usr/local/var/rbenv/versions/2.0.0-p353/lib/ruby/2.0.0/webrick/httpserver.rb:138:in `service'
/usr/local/var/rbenv/versions/2.0.0-p353/lib/ruby/2.0.0/webrick/httpserver.rb:94:in `run'
/usr/local/var/rbenv/versions/2.0.0-p353/lib/ruby/2.0.0/webrick/server.rb:295:in `block in start_thread'
```