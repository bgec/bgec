lazy val hw = (project in file("hw")).settings(
  organization := "pm.s5.bgec",
  name := "bgec-hw",
  version := "0.1.0",
  scalaVersion := "2.11.12",
  resolvers ++= Seq(
    Resolver.sonatypeRepo("snapshots"),
    Resolver.sonatypeRepo("releases"),
  ),
  libraryDependencies ++= Seq(
    "edu.berkeley.cs" %% "chisel3" % "3.2.2",
    "edu.berkeley.cs" %% "chisel-iotesters" % "1.3.2",
  ),
)
