require "variables";
require "vacation";
require "fileinto";
require "envelope";
require "mailbox";
require "imap4flags";
require "regex";
require "relational";
require "date";
require "comparator-i;ascii-numeric";
require "vnd.dovecot.execute";
require "spamtestplus";

if spamtest :percent :value "gt" :comparator "i;ascii-numeric"  "50"
{
  setflag "\\seen";
  fileinto :create "Junk";
  stop;
}

if exists "X-Virus" {
  discard;
  stop;
}
