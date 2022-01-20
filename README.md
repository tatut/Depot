# Depot

Depot is a fuel based object prevalence system for Smalltalk.

Depot can be used in a single image with file based transaction log and snapshots or
clustered with a shared transaction log.


## Rules of prevalence

1. All changes must be done with `system execute: aTxInstance` calls (no calling setters of objects outside of transactions)
2. Transactions must be serializable instances of some DpTransaction subclass
3. Transactions must be *pure* (no IO access, including time and random). Only rely on the instance variables.
