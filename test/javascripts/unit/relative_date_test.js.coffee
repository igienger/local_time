module "relative date"

test "this year", ->
  now = moment()
  el = addTimeEl type: "date", datetime: now.toISOString()
  run()

  equal getText(el), now.format("MMM D")

test "last year", ->
  before = moment().subtract("years", 1).subtract("days", 1)
  el = addTimeEl type: "date", datetime: before.toISOString()
  run()

  equal getText(el), before.format("MMM D, YYYY")


module "relative time or date"


test "today", ->
  now = moment()
  el = addTimeEl type: "time-or-date", datetime: now.toISOString()
  run()

  equal getText(el), now.format("h:mma")

test "before today", ->
  before = moment().subtract("days", 1)
  el = addTimeEl type: "time-or-date", datetime: before.toISOString()
  run()

  equal getText(el), before.format("MMM D")