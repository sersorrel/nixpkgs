{ lib
, buildPythonPackage
, pythonOlder
, fetchFromGitHub
, aiohttp
, async-timeout
, graphql-subscription-manager
, python-dateutil
, pytz
, pytestCheckHook
}:

buildPythonPackage rec {
  pname = "pytibber";
  version = "0.19.1";

  disabled = pythonOlder "3.7";

  src = fetchFromGitHub {
    owner = "Danielhiversen";
    repo = "pyTibber";
    rev = version;
    sha256 = "sha256-+CI2TIGUZTztwx/9JqleKfVksybwGUGiHktu2xcNyUg=";
  };

  propagatedBuildInputs = [
    aiohttp
    async-timeout
    graphql-subscription-manager
    python-dateutil
    pytz
  ];

  checkInputs = [
    pytestCheckHook
  ];

  pytestFlagsArray = [ "test/test.py" ];

  # tests access network
  doCheck = false;

  pythonImportsCheck = [ "tibber" ];

  meta = with lib; {
    description = "A python3 library to communicate with Tibber";
    homepage = "https://github.com/Danielhiversen/pyTibber";
    license = licenses.mit;
    maintainers = with maintainers; [ dotlambda ];
  };
}
