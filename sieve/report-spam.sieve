require "imap4flags";
require "vnd.dovecot.execute";

setflag "\\seen";

execute :pipe "rspamc" ["learn_spam"];
# execute :pipe "rspamc" ["fuzzy_del", "-f", "13"];
# execute :pipe "rspamc" ["fuzzy_add", "-f", "11"];
