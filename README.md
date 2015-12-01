# Docker-xhprof

## How to install

### Build it

```sh
make build
```

### Update your Dockerfile

Replace "FROM php:5.4-apache" by "FROM xhprof:5.4-apache" on your project Dockerfile and run 
```sh
make build
```

### How to profile your code

```php
if (extension_loaded('xhprof')) {
    xhprof_enable(XHPROF_FLAGS_CPU + XHPROF_FLAGS_MEMORY, array('ignored_functions' => array(
        // list of functions to ignore
    )));
}

// your code to profile...

if (extension_loaded('xhprof')) {
    $xhprof_data = xhprof_disable();

    $XHPROF_ROOT = '../../xhprof/';
    include_once $XHPROF_ROOT . '/xhprof_lib/utils/xhprof_lib.php';
    include_once $XHPROF_ROOT . '/xhprof_lib/utils/xhprof_runs.php';

    $xhprof_runs = new XHProfRuns_Default();
    $run_id = $xhprof_runs->save_run($xhprof_data, "xhprof_testing");
}
```

xhprof_testing is the name of your profile. You could use one profile by project for instance.

## See the profiling results

http://darwin.xhprof.dev.affiliatewindow.com/
http://darwin.xhprof.dev.affiliatewindow.com/?source=[[YOUR PROFILE NAME]]
http://darwin.xhprof.dev.affiliatewindow.com/?run=[[RUN ID]]&source=[[YOUR PROFILE NAME]]

## Going further

You can use that for any project. To build an image in order to use XHprof, you need to replace "FROM php:5.4-apache" by "FROM dockerhub.zanox.com:5000/zanox/php4" (like site2) and build it like that
```sh
docker build -t xhprof:[[YOUR TAG NAME]] -f docker/Dockerfile .
```

And replace your project Dockerfile PHP by this one like "FROM dockerhub.zanox.com:5000/zanox/php4" by "FROM xhprof:[[YOUR TAG NAME]]"
