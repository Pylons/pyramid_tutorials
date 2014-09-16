{ pkgs
, pythonPackages
}:

let

  python = pythonPackages.python;
  buildPythonPackage = pythonPackages.buildPythonPackage;

  inherit (pkgs) fetchurl fetchgit;

in rec {

  zope-deprecation = buildPythonPackage rec {
    name = "zope.deprecation-4.1.1";
    src = fetchurl {
      url = "http://pypi.python.org/packages/source/z/zope.deprecation/${name}.tar.gz";
      md5 = "ce261b9384066f7e13b63525778430cb";
    };
    buildInputs = [ zope-testing ];
  };

  venusian = buildPythonPackage rec {
    name = "venusian-1.0";
    src = fetchurl {
      url = "http://pypi.python.org/packages/source/v/venusian/${name}.tar.gz";
      md5 = "dccf2eafb7113759d60c86faf5538756";
    };
    # TODO: https://github.com/Pylons/venusian/issues/23
    doCheck = false;
  };

  translationstring = buildPythonPackage rec {
    name = "translationstring-1.1";
    src = fetchurl {
      url = "http://pypi.python.org/packages/source/t/translationstring/${name}.tar.gz";
      md5 = "0979b46d8f0f852810c8ec4be5c26cf2";
    };
  };

  repoze-sphinx-autointerface = buildPythonPackage rec {
    name = "repoze.sphinx.autointerface-0.7.1";
    src = fetchurl {
      url = "http://pypi.python.org/packages/source/r/repoze.sphinx.autointerface/${name}.tar.gz";
      md5 = "f2fee996ae28dc16eb48f1a3e8f64801";
    };
    propagatedBuildInputs = [ zope-interface Sphinx ];
  };

  repoze-lru = buildPythonPackage rec {
    name = "repoze.lru-0.6";
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/r/repoze.lru/${name}.tar.gz";
      md5 = "2c3b64b17a8e18b405f55d46173e14dd";
    };
    buildInputs = [ nose coverage ];
  };

  zope-exceptions = buildPythonPackage rec {
     name = "zope.exceptions-4.0.7";
     src = fetchurl {
       url = "http://pypi.python.org/packages/source/z/zope.exceptions/${name}.tar.gz";
       md5 = "93daa7463373d755441d2b034709acac";
     };
     # TODO: infinite recursion
     # buildInputs = [ zope-testrunner ];
     propagatedBuildInputs = [ zope-interface ];
     doCheck = false;
  };

  zope-testing = buildPythonPackage rec {
    name = "zope.testing-4.1.3";
    src = fetchurl {
      url = "http://pypi.python.org/packages/source/z/zope.testing/${name}.tar.gz";
      md5 = "6c73c5b668a67fdc116a25b884058ed9";
    };
    propagatedBuildInputs = [ zope-interface zope-exceptions zope-location ];
  };

  zope-event = buildPythonPackage rec {
    name = "zope.event-4.0.3";
    src = fetchurl {
      url = "http://pypi.python.org/packages/source/z/zope.event/${name}.tar.gz";
      md5 = "9a3780916332b18b8b85f522bcc3e249";
    };
  };

  zope-interface = buildPythonPackage rec {
    name = "zope.interface-4.1.1";
    src = fetchurl {
      url = "http://pypi.python.org/packages/source/z/zope.interface/${name}.tar.gz";
      md5 = "edcd5f719c5eb2e18894c4d06e29b6c6";
    };
    propagatedBuildInputs = [ zope-event ];
  };

  zope-proxy = buildPythonPackage rec {
    name = "zope.proxy-4.1.4";
    src = fetchurl {
      url = "http://pypi.python.org/packages/source/z/zope.proxy/${name}.tar.gz";
      md5 = "3bcaf8b8512a99649ecf2f158c11d05b";
    };
    propagatedBuildInputs = [ zope-interface ];
  };

  zope-location = buildPythonPackage rec {
    name = "zope.location-4.0.3";
    src = fetchurl {
      url = "http://pypi.python.org/packages/source/z/zope.location/${name}.tar.gz";
      md5 = "201416f4eb72a9cf61c7d6d37bb87f24";
    };
    propagatedBuildInputs = [ zope-proxy ];
    # ignore circular dependency on zope_schema
    doCheck = false;
  };

  zope-schema = buildPythonPackage rec {
    name = "zope.schema-4.4.1";
    src = fetchurl {
      url = "http://pypi.python.org/packages/source/z/zope.schema/${name}.tar.gz";
      md5 = "afb9281217b79840e1679abeb302467a";
    };
    propagatedBuildInputs = [ zope-location zope-event zope-interface zope-testing ];
  };

  zope-i18nmessageid = buildPythonPackage rec {
    name = "zope.i18nmessageid-4.0.3";
    src = fetchurl {
      url = "http://pypi.python.org/packages/source/z/zope.i18nmessageid/${name}.tar.gz";
      md5 = "fc20d6e548d1671da4ab1d9110667f13";
    };
  };

  zope-configuration = buildPythonPackage rec {
    name = "zope.configuration-4.0.3";
    src = fetchurl {
      url = "http://pypi.python.org/packages/source/z/zope.configuration/${name}.tar.gz";
      md5 = "d85ff342b524bfa819916632d5ef096a";
    };
    propagatedBuildInputs = [ zope-i18nmessageid zope-schema ];
  };

  zope-component = buildPythonPackage rec {
    name = "zope.component-4.2.1";
    src = fetchurl {
      url = "http://pypi.python.org/packages/source/z/zope.component/${name}.tar.gz";
      md5 = "cf55d496428d976f9329a4a2330a8b54";
    };
    propagatedBuildInputs = [
      zope-configuration zope-event zope-i18nmessageid zope-interface
      zope-testing
    ];
    # ignore tests because of a circular dependency on zope_security
    doCheck = false;
  };

  WebOb = buildPythonPackage rec {
    name = "WebOb-1.4";
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/W/WebOb/${name}.tar.gz";
      md5 = "8437607c0cc00c35f658f972516ffb55";
    };
    buildInputs = [ nose coverage Sphinx ];
  };

  WebTest = buildPythonPackage rec {
    name = "WebTest-1.4.3";
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/W/WebTest/${name}.zip";
      md5 = "631ce728bed92c681a4020a36adbc353";
    };
    buildInputs = [ nose coverage unittest2 ];
    propagatedBuildInputs = [ WebOb ];
  };

  virtualenv = buildPythonPackage rec {
    name = "virtualenv-1.11.6";
    src = fetchurl {
      url = "http://pypi.python.org/packages/source/v/virtualenv/${name}.tar.gz";
      md5 = "f61cdd983d2c4e6aeabb70b1060d6f49";
    };
    #patches = [ ../development/python-modules/virtualenv-change-prefix.patch ];
    buildInputs = [ mock nose ];
    propagatedBuildInputs = [
      python.modules.readline python.modules.sqlite3 python.modules.curses
    ];
  };

  PasteDeploy = buildPythonPackage rec {
    name = "PasteDeploy-1.5.2";
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/P/PasteDeploy/${name}.tar.gz";
      md5 = "352b7205c78c8de4987578d19431af3b";
    };
    buildInputs = [ nose ];
  };

  Pygments = buildPythonPackage rec {
    name = "Pygments-1.6";
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/P/Pygments/${name}.tar.gz";
      md5 = "a18feedf6ffd0b0cc8c8b0fbdb2027b1";
    };
  };

  Jinja2 = buildPythonPackage rec {
    name = "Jinja2-2.7.3";
    src = fetchurl {
      url = "http://pypi.python.org/packages/source/J/Jinja2/${name}.tar.gz";
      md5 = "b9dffd2f3b43d673802fe857c8445b1a";
    };
    propagatedBuildInputs = [ MarkupSafe ];
  };

  docutils = buildPythonPackage rec {
    name = "docutils-0.8.1";
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/d/docutils/${name}.tar.gz";
      md5 = "2ecf8ba3ece1be1ed666150a80c838c8";
    };
  };

  Sphinx = buildPythonPackage (rec {
    name = "Sphinx-1.2.2";
    src = fetchurl {
      url = "http://pypi.python.org/packages/source/S/Sphinx/${name}.tar.gz";
      md5 = "3dc73ccaa8d0bfb2d62fb671b1f7e8a4";
    };
    propagatedBuildInputs = [ docutils Jinja2 Pygments ];
  });

  nose = buildPythonPackage rec {
    name = "nose-1.3.3";
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/n/nose/${name}.tar.gz";
      md5 = "42776061bf5206670cb819176dc78654";
    };
    doCheck = false;
  };

  argparse = buildPythonPackage (rec {
    name = "argparse-1.2.1";
    src = fetchurl {
      url = "http://argparse.googlecode.com/files/${name}.tar.gz";
      md5 = "2fbef8cb61e506c706957ab6e135840c";
    };
    # error: invalid command 'test'
    #doCheck = false;
  });

  ipython = buildPythonPackage rec {
    name = "ipython-1.2.1";
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/i/ipython/${name}.tar.gz";
      md5 = "4ffb36697f7ca8cb4a2de0f5b30bc89c";
    };
    buildInputs = [ nose ];
    propagatedBuildInputs = [ python.modules.sqlite3 python.modules.readline ];
  };

  gevent = buildPythonPackage rec {
    name = "gevent-1.0.1";
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/g/gevent/${name}.tar.gz";
      md5 = "7b952591d1a0174d6eb6ac47bd975ab6";
    };
    postPatch = ''
      substituteInPlace "libev/configure" \
        --replace "/usr/bin/file" "${pkgs.file}/bin/file"
      substituteInPlace "c-ares/configure" \
        --replace "/usr/bin/file" "${pkgs.file}/bin/file"
    '';
    buildInputs = [ pkgs.libevent pkgs.file ];
    propagatedBuildInputs = [ greenlet ];
  };

  gevent-websocket = buildPythonPackage rec {
    name = "gevent-websocket-0.9.3";
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/g/gevent-websocket/${name}.tar.gz";
      md5 = "eb59f931d60e068e95adecefaed54df7";
    };
    propagatedBuildInputs = [ gevent ];
  };

  greenlet = buildPythonPackage rec {
    name = "greenlet-0.4.3";
    src = fetchurl {
      url = "http://pypi.python.org/packages/source/g/greenlet/${name}.zip";
      md5 = "a5e467a5876c415cd357c1ab9027e06c";
    };
  };

  six = buildPythonPackage rec {
    name = "six-1.7.3";
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/s/six/${name}.tar.gz";
      md5 = "784c6e5541c3c4952de9c0a966a0a80b";
    };
  };

  pyflakes = buildPythonPackage rec {
    name = "pyflakes-0.8.1";
    src = fetchurl {
      url = "http://pypi.python.org/packages/source/p/pyflakes/${name}.tar.gz";
      md5 = "905fe91ad14b912807e8fdc2ac2e2c23";
    };
    buildInputs = [ unittest2 ];
  };

  pep8 = buildPythonPackage rec {
    name = "pep8-1.5.7";
    src = fetchurl {
      url = "http://pypi.python.org/packages/source/p/pep8/${name}.tar.gz";
      md5 = "f6adbdd69365ecca20513c709f9b7c93";
    };
  };

  meld3 = buildPythonPackage rec {
    name = "meld3-1.0.0";
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/m/meld3/${name}.tar.gz";
      md5 = "ca270506dd4ecb20ae26fa72fbd9b0be";
    };
    buildInputs = [ ];
  };

  mccabe = buildPythonPackage (rec {
    name = "mccabe-0.2.1";
    src = fetchurl {
      url = "http://pypi.python.org/packages/source/m/mccabe/${name}.tar.gz";
      md5 = "5a3f3fa6a4bad126c88aaaa7dab682f5";
    };
  });

  jsonschema = buildPythonPackage rec {
    name = "jsonschema-2.3.0";
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/j/jsonschema/${name}.tar.gz";
      md5 = "410075e1969a9ec1838b5a6e1313c32b";
    };
  };

  unittest2 = buildPythonPackage rec {
    name = "unittest2-0.5.1";
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/u/unittest2/${name}.tar.gz";
      md5 = "a0af5cac92bbbfa0c3b0e99571390e0f";
    };
  };

  wheel = buildPythonPackage rec {
    name = "wheel-0.24.0";
    buildInputs = [ jsonschema pytest coverage pytest-cov ];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/w/wheel/${name}.tar.gz";
      md5 = "3b0d66f0d127ea8befaa5d11453107fd";
    };
  };

  invoke = buildPythonPackage rec {
    name = "invoke-0.8.2";
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/i/invoke/${name}.tar.gz";
      md5 = "5e541ad01f45b5a508992b1a58bc8251";
    };
  };

  coverage = buildPythonPackage rec {
    version = "3.7.1";
    name = "coverage-${version}";
    src = fetchurl {
      url = "http://pypi.python.org/packages/source/c/coverage/${name}.tar.gz";
      md5 = "c47b36ceb17eaff3ecfab3bcd347d0df";
    };
  };

  py = buildPythonPackage rec {
    version = "1.4.22";
    name = "py-${version}";
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/p/py/${name}.tar.gz";
      md5 = "1af93ed9a00bc38385142ae0eb7cf3ff";
    };
  };

  cov-core = buildPythonPackage rec {
    version = "1.13.0";
    name = "cov-core-${version}";
    propagatedBuildInputs = [ coverage ];
    src = fetchurl {
      url = "http://pypi.python.org/packages/source/c/cov-core/${name}.tar.gz";
      md5 = "8999e0bc50bca5a09d7731a3d42bfcd1";
    };
  };

  versiontools = buildPythonPackage rec {
    name = "versiontools-1.9.1";
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/v/versiontools/${name}.tar.gz";
      md5 = "602b7db8eea30dd29a1d451997adf251";
    };
  };

  Mako = buildPythonPackage rec {
    name = "Mako-1.0.0";
    buildInputs = [ nose mock ];
    propagatedBuildInputs = [
      MarkupSafe
    ];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/M/Mako/${name}.tar.gz";
      md5 = "ae27c6512832fe528bb67f1a851921cc";
    };
  };

  MarkupSafe = buildPythonPackage rec {
    name = "MarkupSafe-0.19";
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/M/MarkupSafe/${name}.tar.gz";
      md5 = "ccb3f746c807c5500850987006854a6d";
    };
  };

  Whoosh = buildPythonPackage rec {
    name = "Whoosh-2.5.7";
    buildInputs = [ pytest ];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/W/Whoosh/${name}.tar.gz";
      md5 = "9d35a7498d5c7af8fe162f63719f4eeb";
    };
  };

  chardet = buildPythonPackage rec {
    name = "chardet-2.2.1";
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/c/chardet/${name}.tar.gz";
      md5 = "4a758402eaefd0331bdedc7ecb6f452c";
    };
  };

  click = buildPythonPackage rec {
    name = "click-2.5";
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/c/click/${name}.tar.gz";
      md5 = "a1bff2d2270745affd5bc60e66e50c23";
    };
  };

  configobj = buildPythonPackage rec {
    name = "configobj-5.0.5";
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/c/configobj/${name}.tar.gz";
      md5 = "00af246754b4bb41a4e9c625c60dca5c";
    };
    propagatedBuildInputs = [ six ];
  };

  flake8 = buildPythonPackage (rec {
    name = "flake8-2.2.2";
    src = fetchurl {
      url = "http://pypi.python.org/packages/source/f/flake8/${name}.tar.gz";
      md5 = "5489f7dbec86de460839fa4290997040";
    };
    buildInputs = [ nose mock ];
    propagatedBuildInputs = [ pyflakes pep8 mccabe ];
  });

  future = buildPythonPackage rec {
    name = "future-0.12.4";
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/f/future/${name}.tar.gz";
      md5 = "e68b9b3d95f9fb6db7f2386541e38e38";
    };
    doCheck = false;
  };

  gevent-socketio = buildPythonPackage rec {
    name = "gevent-socketio-0.3.6";
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/g/gevent-socketio/${name}.tar.gz";
      md5 = "33f745d74885366a07da516c000854b6";
    };
    buildInputs = [ versiontools mock pytest ];
    propagatedBuildInputs = [ gevent gevent-websocket ];
  };

  ipdb = buildPythonPackage rec {
    name = "ipdb-0.8";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/source/i/ipdb/${name}.zip";
      md5 = "96dca0712efa01aa5eaf6b22071dd3ed";
    };
    propagatedBuildInputs = [ ipython ];
  };

  mock = buildPythonPackage rec {
    name = "mock-1.0.1";
    buildInputs = [ unittest2 ];
    propagatedBuildInputs = [ ];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/m/mock/${name}.tar.gz";
      md5 = "c3971991738caa55ec7c356bbc154ee2";
    };
  };

  plumbum = buildPythonPackage rec {
    name = "plumbum-1.4.2";
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/p/plumbum/${name}.tar.gz";
      md5 = "38b526af9012a5282ae91dfe372cefd3";
    };
  };

  pyramid = buildPythonPackage rec {
    name = "pyramid-1.5.1";
    src = fetchurl {
      url = "http://pypi.python.org/packages/source/p/pyramid/${name}.tar.gz";
      md5 = "8a1ab3b773d8e22437828f7df22852c1";
    };
    buildInputs = [ docutils virtualenv WebTest zope-component zope-interface ];
    propagatedBuildInputs = [
      PasteDeploy repoze-lru repoze-sphinx-autointerface translationstring
      venusian WebOb zope-deprecation zope-interface
    ];
    doCheck = false;
    # TODO: fix one test
    # ======================================================================
    # FAIL: test_without_content_type (pyramid.tests.test_response.TestFileResponse)
    # ----------------------------------------------------------------------
    # Traceback (most recent call last):
    #   File "/tmp/nix-build-python2.7-pyramid-1.5.1.drv-0/pyramid-1.5.1/pyramid/tests/test_response.py", line 61, in test_without_content_type
    #     self.assertEqual(r.content_type, content_type.split(';')[0])
    # AssertionError: 'text/xml' != 'application/xml'
    #
    # ----------------------------------------------------------------------
  };

  pyramid_mako = buildPythonPackage rec {
    name = "pyramid_mako-1.0.2";
    src = fetchurl {
      url = "http://pypi.python.org/packages/source/p/pyramid_mako/${name}.tar.gz";
      md5 = "ee25343a97eb76bd90abdc2a774eb48a";
    };
    buildInputs = [ 
      WebTest Sphinx docutils repoze-sphinx-autointerface nose coverage
      virtualenv
    ];
    propagatedBuildInputs = [ pyramid Mako ];
  };

  pytest = buildPythonPackage rec {
    version = "2.6.0";
    name = "pytest-${version}";
    buildInputs = [ pkgs.bashInteractive pkgs.lsof mock nose ];
    propagatedBuildInputs = [ py ];
    src = fetchurl {
      url = "http://pypi.python.org/packages/source/p/pytest/${name}.tar.gz";
      md5 = "e492f76a986cb9dd0818b7ecc89af92e";
    };
    doCheck = false;
    # TODO: one test failing
    # testing/test_argcomplete.TestArgComplete.test_remove_dir_prefix
  };

  requests = buildPythonPackage rec {
    name = "requests-2.3.0";
    src = fetchgit {
      url = "https://github.com/kennethreitz/requests";
      rev = "refs/tags/v2.3.0";
      md5 = "04d4738e17665dd9fb9545b1622f0975";
    };
    buildInputs = [ py pytest pytest-cov invoke wheel ];
  };

  responses = buildPythonPackage rec {
    name = "responses-0.2.2";
    src = fetchgit {
      url = "https://github.com/dropbox/responses";
      rev = "refs/tags/0.2.2";
      md5 = "62d2ae22e74edba2312ae59ee6dfedcc";
    };
    buildInputs = [ pytest pytest-cov flake8 ];
    propagatedBuildInputs = [ requests mock six ];
    doCheck = false;
  };

  pytest-cov = buildPythonPackage rec {
    name = "pytest-cov-1.7.0";
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/p/pytest-cov/${name}.tar.gz";
      md5 = "c1432814f2e19ed86b563efa374b23a1";
    };
    propagatedBuildInputs = [ py pytest cov-core ];
  };

  semantic_version = buildPythonPackage rec {
    name = "semantic_version-2.3.0";
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/s/semantic_version/${name}.tar.gz";
      md5 = "3d3e9abc4cdd2dc37af8e3fc28affe64";
    };
  };

  supervisor = buildPythonPackage rec {
    name = "supervisor-3.1.2";
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/s/supervisor/${name}.tar.gz";
      md5 = "cc2da66b3a56ff2036b09e3c66b2cd1e";
    };
    propagatedBuildInputs = [ meld3 mock ];
    doCheck = false; # fails on darwin
  };

  trafaret = buildPythonPackage rec {
    name = "trafaret-0.5.0";
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/t/trafaret/${name}.tar.gz";
      md5 = "c37b6aaf1f0efbb79a1b00fce45cbfdc";
    };
  };

  waitress = buildPythonPackage rec {
    name = "waitress-0.8.8";
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/w/waitress/${name}.tar.gz";
      md5 = "c0a40f34b5410348579556cd4a21c1c2";
    };
    doCheck = false;
  };


}
