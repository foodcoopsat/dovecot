require ["vnd.dovecot.execute", "copy", "imapsieve", "environment", "variables"];

if environment :matches "imap.mailbox" "*" {
  set "mailbox" "${1}";
}

if string "${mailbox}" "Trash" {
  stop;
}

execute :pipe "rspamc" ["learn_ham"];
# execute :pipe "rspamc" ["fuzzy_del", "-f", "11"];
# execute :pipe "rspamc" ["fuzzy_add", "-f", "13"];
